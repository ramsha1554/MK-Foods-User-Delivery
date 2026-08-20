import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../data/models/customer_models.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_dialogs.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/app_skeleton.dart';
import '../providers/orders_provider.dart';
import 'order_details_screen.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(ordersProvider.notifier).fetchOrders();
    });
  }

  Future<void> _confirmCancel(BuildContext context, WidgetRef ref, MyOrder order) async {
    final reason = await showAppInputDialog(
      context,
      title: 'Cancel this order?',
      hintText: 'Reason (optional)',
      confirmLabel: 'Cancel Order',
      isDestructive: true,
      cancelLabel: 'Keep Order',
    );

    if (reason == null) return;
    final success = await ref.read(ordersProvider.notifier).cancelOrder(
          order.id,
          reason: reason.isEmpty ? null : reason,
        );
    if (context.mounted) {
      AppSnackbar.show(
        context,
        success ? 'Order cancelled.' : 'Failed to cancel order.',
        type: success ? AppSnackbarType.success : AppSnackbarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ordersProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('My Orders')),
      body: state.isLoading && state.orders.isEmpty
          ? const _OrdersListSkeleton()
          : state.orders.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.xxl),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
                          child: const Icon(LucideIcons.receipt, size: 32, color: AppColors.primary),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Text('No orders yet', style: AppTextStyles.h2),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Your order history will show up here.',
                          style: AppTextStyles.bodySecondary,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () => ref.read(ordersProvider.notifier).fetchOrders(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      final order = state.orders[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OrderDetailsScreen(orderId: order.id),
                            ),
                          );
                        },
                        child: _OrderCard(
                          order: order,
                          isCancelling: state.cancellingOrderId == order.id,
                          onCancel: () => _confirmCancel(context, ref, order),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final MyOrder order;
  final bool isCancelling;
  final VoidCallback onCancel;

  const _OrderCard({required this.order, required this.isCancelling, required this.onCancel});

  ({String label, Color color}) _statusMeta(String? status) {
    switch (status) {
      case 'delivered':
        return (label: 'Delivered', color: AppColors.success);
      case 'cancelled':
      case 'rejected':
        return (label: status == 'rejected' ? 'Rejected' : 'Cancelled', color: AppColors.error);
      case 'placed':
        return (label: 'Placed', color: AppColors.info);
      case 'confirmed':
        return (label: 'Confirmed', color: AppColors.info);
      case 'preparing':
        return (label: 'Preparing', color: AppColors.warning);
      case 'ready':
        return (label: 'Ready', color: AppColors.warning);
      case 'picked_up':
        return (label: 'Picked Up', color: AppColors.primary);
      case 'on_the_way':
        return (label: 'On the Way', color: AppColors.primary);
      default:
        return (label: status ?? 'Unknown', color: AppColors.textSecondary);
    }
  }

  @override
  Widget build(BuildContext context) {
    final meta = _statusMeta(order.status);
    final canCancel = cancellableStatuses.contains(order.status);

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  order.restaurant?.name ?? 'Restaurant',
                  style: AppTextStyles.cardTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: meta.color.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(meta.label, style: AppTextStyles.badge.copyWith(color: meta.color)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('#${order.orderNumber}', style: AppTextStyles.caption),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Text(
                '£${(order.total ?? 0).toStringAsFixed(2)}',
                style: AppTextStyles.price,
              ),
              const Spacer(),
              if (canCancel)
                isCancelling
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.error),
                      )
                    : TextButton(
                        onPressed: onCancel,
                        style: TextButton.styleFrom(foregroundColor: AppColors.error),
                        child: const Text('Cancel'),
                      ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OrdersListSkeleton extends StatelessWidget {
  const _OrdersListSkeleton();

  @override
  Widget build(BuildContext context) {
    return SkeletonPulse(
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: const [
          _OrderCardSkeleton(),
          _OrderCardSkeleton(),
          _OrderCardSkeleton(),
          _OrderCardSkeleton(),
        ],
      ),
    );
  }
}

class _OrderCardSkeleton extends StatelessWidget {
  const _OrderCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: SkeletonText(width: double.infinity, height: 16)),
              SizedBox(width: AppSpacing.md),
              SkeletonBox(width: 56, height: 20, radius: 6),
            ],
          ),
          SizedBox(height: 8),
          SkeletonText(width: 100, height: 12),
          SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              SkeletonText(width: 60, height: 14),
              Spacer(),
              SkeletonBox(width: 56, height: 24, radius: 8),
            ],
          ),
        ],
      ),
    );
  }
}