import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../data/models/customer_models.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_dialogs.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/app_skeleton.dart';
import '../providers/order_details_provider.dart';
import '../providers/orders_provider.dart';

class OrderDetailsScreen extends ConsumerWidget {
  final String orderId;

  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderDetailsProvider(orderId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(orderDetailsProvider(orderId).future),
        child: orderAsync.when(
          loading: () => const _OrderDetailsSkeleton(),
          error: (error, _) => ListView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            children: [
              const Icon(LucideIcons.circleAlert, color: AppColors.error, size: 48),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Failed to load order',
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                error.toString(),
                style: AppTextStyles.bodySecondary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          data: (order) => _OrderDetailsView(order: order),
        ),
      ),
    );
  }
}

class _OrderDetailsView extends ConsumerWidget {
  final Order order;

  const _OrderDetailsView({required this.order});

  Future<void> _confirmCancel(BuildContext context, WidgetRef ref) async {
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
    if (success) {
      ref.invalidate(orderDetailsProvider(order.id));
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'delivered':
        return AppColors.success;
      case 'cancelled':
      case 'rejected':
        return AppColors.error;
      case 'placed':
      case 'confirmed':
        return AppColors.info;
      case 'preparing':
      case 'ready':
        return AppColors.warning;
      case 'picked_up':
      case 'on_the_way':
        return AppColors.primary;
      default:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusColor = _getStatusColor(order.status);
    final isCancelable = ['placed', 'confirmed', 'preparing'].contains(order.status);

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        // Status Banner
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: statusColor.withValues(alpha: 0.5)),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: statusColor),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status: ${order.status.toUpperCase()}',
                      style: AppTextStyles.cardTitle.copyWith(color: statusColor),
                    ),
                    if (order.createdAt != null)
                      Text(
                        'Placed on ${DateFormat('MMM d, y h:mm a').format(order.createdAt!)}',
                        style: AppTextStyles.caption,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xl),

        // Items Breakdown
        Text('Items', style: AppTextStyles.h2),
        const SizedBox(height: AppSpacing.sm),
        ...order.items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item.quantity}x', style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(item.name ?? 'Unknown item', style: AppTextStyles.body),
                  ),
                  Text('£${(item.itemTotal ?? 0).toStringAsFixed(2)}', style: AppTextStyles.body),
                ],
              ),
            )),

        const Divider(height: AppSpacing.xl),

        // Bill Summary
        Text('Bill Summary', style: AppTextStyles.h2),
        const SizedBox(height: AppSpacing.sm),
        _SummaryRow(label: 'Subtotal', amount: order.subtotal ?? 0),
        _SummaryRow(label: 'Delivery Fee', amount: order.deliveryFee ?? 0),
        if (order.platformFee != null && order.platformFee! > 0)
          _SummaryRow(label: 'Platform Fee', amount: order.platformFee!),
        const SizedBox(height: AppSpacing.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: AppTextStyles.cardTitle),
            Text('£${order.total.toStringAsFixed(2)}', style: AppTextStyles.price),
          ],
        ),

        const Divider(height: AppSpacing.xl),

        // Delivery Details
        Text('Delivery To', style: AppTextStyles.h2),
        const SizedBox(height: AppSpacing.sm),
        if (order.deliveryAddress != null) ...[
          Text(order.deliveryAddress!.label, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold)),
          Text(order.deliveryAddress!.fullAddress, style: AppTextStyles.bodySecondary),

        ],

        if (order.specialInstructions != null && order.specialInstructions!.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          Text('Special Instructions', style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold)),
          Text(order.specialInstructions!, style: AppTextStyles.bodySecondary),
        ],

        const SizedBox(height: AppSpacing.xxl),

        // Action Button
        if (isCancelable)
          ElevatedButton(
            onPressed: () => _confirmCancel(context, ref),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('Cancel Order'),
          ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double amount;

  const _SummaryRow({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodySecondary),
          Text('£${amount.toStringAsFixed(2)}', style: AppTextStyles.body),
        ],
      ),
    );
  }
}

class _OrderDetailsSkeleton extends StatelessWidget {
  const _OrderDetailsSkeleton();

  @override
  Widget build(BuildContext context) {
    return SkeletonPulse(
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: const [
          _StatusBannerSkeleton(),
          SizedBox(height: AppSpacing.xl),
          SkeletonText(width: 48, height: 16),
          SizedBox(height: AppSpacing.sm),
          _ItemRowSkeleton(),
          _ItemRowSkeleton(),
          _ItemRowSkeleton(),
          Divider(height: AppSpacing.xl),
          SkeletonText(width: 100, height: 16),
          SizedBox(height: AppSpacing.sm),
          _SummaryRowSkeleton(),
          _SummaryRowSkeleton(),
          _SummaryRowSkeleton(),
          SizedBox(height: AppSpacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkeletonText(width: 60, height: 16),
              SkeletonText(width: 70, height: 16),
            ],
          ),
          Divider(height: AppSpacing.xl),
          SkeletonText(width: 80, height: 16),
          SizedBox(height: AppSpacing.sm),
          SkeletonText(width: 140, height: 14),
          SizedBox(height: 4),
          SkeletonText(width: double.infinity, height: 12),
          SizedBox(height: AppSpacing.xxl),
          SkeletonBox(width: double.infinity, height: 48, radius: 16),
        ],
      ),
    );
  }
}

class _StatusBannerSkeleton extends StatelessWidget {
  const _StatusBannerSkeleton();

  @override
  Widget build(BuildContext context) {
    return const SkeletonCard(
      radius: 12,
      child: Row(
        children: [
          SkeletonCircle(size: 20),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonText(width: 140, height: 14),
                SizedBox(height: 4),
                SkeletonText(width: 180, height: 11),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemRowSkeleton extends StatelessWidget {
  const _ItemRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonText(width: 24, height: 14),
          SizedBox(width: AppSpacing.md),
          Expanded(child: SkeletonText(width: double.infinity, height: 14)),
          SkeletonText(width: 48, height: 14),
        ],
      ),
    );
  }
}

class _SummaryRowSkeleton extends StatelessWidget {
  const _SummaryRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SkeletonText(width: 70, height: 12),
          SkeletonText(width: 48, height: 12),
        ],
      ),
    );
  }
}
