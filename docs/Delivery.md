Base URL: https://supplier-prewar-corrosive.ngrok-free.dev/api/v1

Workflow Steps:
1. Onboarding:
- User applies as a delivery driver: POST /drivers/register (specifying
vehicle category: bicycle, car, motorcycle, van).
- Driver uploads compliance files (driving licence, insurance certificates) using
POST /drivers/documents.
- Once admin reviews and approves the documents, the driver's status becomes
approved.
2. Go Online:
- Driver marks availability: PATCH /drivers/toggle-online (isOnline =
true).
3. Dispatch Allocation:
- Driver's app streams GPS position via Sockets (event:
driver:location-update).
- When an order in the driver's radius is marked ready, the server assigns it,
sending a Socket.io alert (order:assigned) and an FCM push notification.
- Driver accepts the delivery request: PATCH
/drivers/requests/:id/accept (or declines via /decline).
4. Fulfillment Cycle:
- Driver navigates to the restaurant, collects items, and confirms: PATCH
/orders/:id/pickup.
- Driver navigates to the customer's coordinates (transmitting real-time GPS
locations to the customer room via socket).
- Driver hand-delivers the order and confirms: PATCH /orders/:id/deliver.
The server automatically calculates driver payout and logs it in the virtual ledger.
Relevant Endpoints:
- POST /drivers/register — Register driver profile.
- POST /drivers/documents — Upload licence / insurance files.
- GET /drivers/documents — Review uploaded documents.
- PATCH /drivers/toggle-online — Go online/offline.
- PATCH /users/me/location — Stream GPS updates.
- GET /orders/driver/active — Fetch current in-progress task.
- GET /orders/driver/history — List completed deliveries.
- PATCH /orders/:id/pickup — Confirm collection from kitchen.
- PATCH /orders/:id/deliver — Confirm dropoff to customer.
- GET /drivers/earnings — Driver financial summary panel.


#### 🔌 Driver API Reference
---
### 1. Register as Delivery Driver
* **URL:** `POST {{baseUrl}}/drivers/register`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  Content-Type: application/json
  ```
* **Request Body:**
  ```json
  {
    "name": "Driver Dave",
    "vehicleType": "motorcycle"
  }
  ```
  * `name` *(string, optional)*: Display name of the driver.
  * `vehicleType` *(string, optional)*: Driver's transport type. Allowed values: `bicycle`, `motorcycle`, `car`, `van`.
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Registered as delivery partner — pending approval",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e742c",
          "phone": "+447123456789",
          "name": "Driver Dave",
          "role": "driver",
          "driverStatus": "pending",
          "vehicleType": "motorcycle",
          "isVerified": true,
          "isActive": true
        }
      }
      ```
  * **Scenario B: Conflict (Already Registered)**
    * **Status:** `409 Conflict`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "You are already registered as a delivery partner."
      }
      ```
---
### 2. Upload Compliance Document
* **URL:** `POST {{baseUrl}}/drivers/documents`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  Content-Type: multipart/form-data
  ```
* **Request Body (Multipart Form-Data):**
  * `type` *(text, required)*: Document classification. Allowed values: `driving_licence`, `insurance`, `vehicle_details`, `profile_photo`.
  * `document` *(file, required)*: PDF/JPEG/PNG image up to 5MB.
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `201 Created`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Document uploaded successfully",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e743a",
          "driver": "60d5ecb8b39d1b001f3e742c",
          "type": "driving_licence",
          "fileUrl": "/uploads/documents/document-1625310000000.pdf",
          "originalName": "licence_front.pdf",
          "status": "pending",
          "adminNote": "",
          "createdAt": "2026-07-04T12:00:00.000Z",
          "updatedAt": "2026-07-04T12:00:00.000Z"
        }
      }
      ```
  * **Scenario B: Missing File**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "No file uploaded",
        "data": null
      }
      ```
  * **Scenario C: Oversized File or Bad Format**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "File size exceeds 5MB limit"
      }
      ```
---
### 3. Review Uploaded Documents
* **URL:** `GET {{baseUrl}}/drivers/documents`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  ```
* **Request Body:** None
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Success",
        "data": [
          {
            "_id": "60d5ecb8b39d1b001f3e743a",
            "driver": "60d5ecb8b39d1b001f3e742c",
            "type": "driving_licence",
            "fileUrl": "/uploads/documents/document-1625310000000.pdf",
            "originalName": "licence_front.pdf",
            "status": "approved",
            "adminNote": "Document looks clear",
            "createdAt": "2026-07-04T12:00:00.000Z"
          }
        ]
      }
      ```
---
### 4. Go Online/Offline
* **URL:** `PATCH {{baseUrl}}/drivers/toggle-online`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  ```
* **Request Body:** None
* **Responses:**
  * **Scenario A: Success (Online)**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "You are now online",
        "data": {
          "isOnline": true
        }
      }
      ```
  * **Scenario B: Success (Offline)**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "You are now offline",
        "data": {
          "isOnline": false
        }
      }
      ```
  * **Scenario C: Forbidden (Registration Profile Not Approved)**
    * **Status:** `403 Forbidden`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Your account must be approved before going online."
      }
      ```
---
### 5. Stream GPS Location
* **URL:** `PATCH {{baseUrl}}/users/me/location`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  Content-Type: application/json
  ```
* **Request Body:**
  ```json
  {
    "longitude": -0.760269,
    "latitude": 52.040622
  }
  ```
  * `longitude` *(number, required)*: Decimal coordinate within range [-180, 180].
  * `latitude` *(number, required)*: Decimal coordinate within range [-90, 90].
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Location updated",
        "data": {
          "currentLocation": {
            "type": "Point",
            "coordinates": [-0.760269, 52.040622]
          }
        }
      }
      ```
  * **Scenario B: Validation Error**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Validation error: \"latitude\" is required"
      }
      ```
---
### 6. Fetch Current In-Progress Task
* **URL:** `GET {{baseUrl}}/orders/driver/active`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  ```
* **Request Body:** None
* **Responses:**
  * **Scenario A: Success (Active Delivery Found)**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Success",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e742f",
          "orderNumber": "MK-20260703-0001",
          "customer": {
            "_id": "60d5ecb8b39d1b001f3e742a",
            "name": "Customer Carol",
            "phone": "+447000111222"
          },
          "restaurant": {
            "_id": "60d5ecb8b39d1b001f3e742c",
            "name": "Milton Keynes Pizzeria",
            "phone": "+441908123456",
            "address": {
              "street": "12 Queensway",
              "city": "Milton Keynes",
              "postcode": "MK2 2HE"
            },
            "location": {
              "type": "Point",
              "coordinates": [-0.730245, 52.001248]
            }
          },
          "deliveryAddress": {
            "label": "Home",
            "fullAddress": "15 Midsummer Blvd, Milton Keynes MK9 3GB",
            "location": {
              "type": "Point",
              "coordinates": [-0.759423, 52.040612]
            }
          },
          "status": "ready",
          "total": 23.48,
          "specialInstructions": "Leave at doorstep"
        }
      }
      ```
  * **Scenario B: Success (No In-Progress Task)**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Success",
        "data": null
      }
      ```
---
### 7. List Completed Deliveries
* **URL:** `GET {{baseUrl}}/orders/driver/history`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  ```
* **Query Parameters:**
  * `page` *(number, optional)*: Page offset *(default: 1)*.
  * `limit` *(number, optional)*: Page limit limit *(default: 20)*.
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Success",
        "data": [
          {
            "_id": "60d5ecb8b39d1b001f3e742f",
            "orderNumber": "MK-20260703-0001",
            "restaurant": {
              "_id": "60d5ecb8b39d1b001f3e742c",
              "name": "Milton Keynes Pizzeria"
            },
            "status": "delivered",
            "total": 23.48,
            "createdAt": "2026-07-03T12:10:00.000Z"
          }
        ],
        "pagination": {
          "total": 1,
          "page": 1,
          "limit": 20,
          "pages": 1,
          "hasNextPage": false,
          "hasPrevPage": false
        }
      }
      ```
---
### 8. Confirm Collection from Kitchen
* **URL:** `PATCH {{baseUrl}}/orders/:id/pickup`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  ```
* **Request Body:** None
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Pickup confirmed",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e742f",
          "orderNumber": "MK-20260703-0001",
          "status": "picked_up",
          "statusHistory": [
            {
              "status": "ready",
              "timestamp": "2026-07-03T12:35:00.000Z"
            },
            {
              "status": "picked_up",
              "timestamp": "2026-07-03T12:45:00.000Z"
            }
          ]
        }
      }
      ```
  * **Scenario B: Transition State Error (Order not yet ready)**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Cannot transition from 'preparing' to 'picked_up'."
      }
      ```
---
### 9. Confirm Dropoff to Customer
* **URL:** `PATCH {{baseUrl}}/orders/:id/deliver`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  ```
* **Request Body:** None
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Order delivered",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e742f",
          "orderNumber": "MK-20260703-0001",
          "status": "delivered",
          "actualDeliveryTime": "2026-07-03T13:00:00.000Z",
          "statusHistory": [
            {
              "status": "picked_up",
              "timestamp": "2026-07-03T12:45:00.000Z"
            },
            {
              "status": "delivered",
              "timestamp": "2026-07-03T13:00:00.000Z"
            }
          ]
        }
      }
      ```
  * **Scenario B: Transition State Error**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Cannot transition from 'ready' to 'delivered'."
      }
      ```
---
### 10. Driver Financial Summary Panel
* **URL:** `GET {{baseUrl}}/drivers/earnings`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  ```
* **Query Parameters:**
  * `page` *(number, optional)*: Page offset *(default: 1)*.
  * `limit` *(number, optional)*: Page size size *(default: 20)*.
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Success",
        "data": {
          "orders": [
            {
              "_id": "60d5ecb8b39d1b001f3e742f",
              "orderNumber": "MK-20260703-0001",
              "restaurant": {
                "_id": "60d5ecb8b39d1b001f3e742c",
                "name": "Milton Keynes Pizzeria"
              },
              "deliveryFee": 3.50,
              "actualDeliveryTime": "2026-07-03T13:00:00.000Z"
            }
          ],
          "total": 1,
          "page": 1,
          "limit": 20,
          "summary": {
            "totalDeliveries": 1,
            "totalEarnings": 3.50,
            "todayDeliveries": 1,
            "todayEarnings": 3.50
          }
        }
      }
      ```
---

# ⚡ Real-Time Events & FCM Push Notifications Specification

This document provides a comprehensive operational mapping of all **Socket.io events** and **Firebase Cloud Messaging (FCM) Push Notifications** within the Milton Keynes Food Delivery platform. It describes trigger conditions, payloads, and the recipient/sender roles for each user type.

---

## 👥 1. Socket & Room Architecture Overview

To support real-time features, the server orchestrates connections using rooms and mappings:
1. **User Personal Room (`user:<userId>`)**: Every authenticated socket automatically joins this room upon connection. It is used to target individual users with direct notifications.
2. **Order Broadcast Room (`order:<orderId>`)**: Clients (Customers, Drivers, Restaurant Owners, and Admins) join this room to coordinate order tracking.
3. **Driver Socket Mapping (`driverSockets`)**: An in-memory mapping (`driverId` -> `socket.id`) maintained on the server for active drivers. This allows direct real-time order dispatch notifications.

---

## 👤 2. Customer Module

### A. Socket.io Events
* **`order:join`** *(Inbound)*
  * **Trigger Scene:** Triggered when the customer navigates to the order detail / tracking screen.
  * **Payload:** `orderId` *(string)*
  * **Behavior:** Adds the client's socket connection to the room `order:<orderId>`.
* **`order:leave`** *(Inbound)*
  * **Trigger Scene:** Triggered when the customer exits the tracking screen.
  * **Payload:** `orderId` *(string)*
  * **Behavior:** Removes the client's socket connection from the room `order:<orderId>`.
* **`order:status-update`** *(Outbound)*
  * **Trigger Scene:** Broadcasted to the room `order:<orderId>` whenever the order changes status (e.g., from `placed` to `confirmed`, `preparing`, etc.).
  * **Payload:**
    ```json
    {
      "orderId": "60d5ecb8b39d1b001f3e742f",
      "status": "confirmed"
    }
    ```
* **`tracking:location`** *(Outbound)*
  * **Trigger Scene:** Broadcasted to the room `order:<orderId>` when the assigned driver streams location updates.
  * **Payload:**
    ```json
    {
      "longitude": -0.760142,
      "latitude": 52.039841,
      "timestamp": "2026-07-03T13:25:14.000Z"
    }
    ```

### B. FCM Push Notifications
* **`order_confirmed`**
  * **Trigger Scene:** Restaurant owner confirms the placed order.
  * **Title:** `Order Confirmed`
  * **Body:** `Your order #<orderNumber> has been confirmed by the restaurant.`
  * **Payload:** `{ orderId: "<id>" }`
* **`order_preparing`**
  * **Trigger Scene:** Restaurant owner marks the order as preparing.
  * **Title:** `Order Being Prepared`
  * **Body:** `Your order #<orderNumber> is being prepared.`
  * **Payload:** `{ orderId: "<id>" }`
* **`order_ready`**
  * **Trigger Scene:** Restaurant marks order as prepared and ready for delivery driver pickup.
  * **Title:** `Order Ready`
  * **Body:** `Your order #<orderNumber> is ready for pickup.`
  * **Payload:** `{ orderId: "<id>" }`
* **`order_picked_up`**
  * **Trigger Scene:** Driver picks up items from counter and marks the order picked up.
  * **Title:** `Order Picked Up`
  * **Body:** `Your order #<orderNumber> has been picked up by the delivery partner.`
  * **Payload:** `{ orderId: "<id>" }`
* **`order_on_the_way`**
  * **Trigger Scene:** Driver departs restaurant towards delivery location.
  * **Title:** `On The Way`
  * **Body:** `Your order #<orderNumber> is on the way!`
  * **Payload:** `{ orderId: "<id>" }`
* **`order_delivered`**
  * **Trigger Scene:** Driver hand-delivers order at doorstep and confirms fulfillment.
  * **Title:** `Order Delivered`
  * **Body:** `Your order #<orderNumber> has been delivered. Enjoy!`
  * **Payload:** `{ orderId: "<id>" }`
* **`order_cancelled`**
  * **Trigger Scene:** Order cancelled by customer (only valid when in `placed` status) or by Admin.
  * **Title:** `Order Cancelled`
  * **Body:** `Your order #<orderNumber> has been cancelled.`
  * **Payload:** `{ orderId: "<id>" }`
* **`order_rejected`**
  * **Trigger Scene:** Restaurant owner declines/rejects the order.
  * **Title:** `Order Rejected`
  * **Body:** `Your order #<orderNumber> was rejected by the restaurant.`
  * **Payload:** `{ orderId: "<id>" }`
* **`account_suspended`**
  * **Trigger Scene:** Administrator suspends the customer's account.
  * **Title:** `Account Suspended`
  * **Body:** `<reason_text_or_default_message>`
  * **Payload:** None.

---

## 🚴 3. Delivery Partner (Driver) Module

### A. Socket.io Events
* **`connection`** *(System Setup)*
  * **Trigger Scene:** Handshake authentication success.
  * **Behavior:** Automatically maps driver `userId` to the active socket ID in server memory map (`driverSockets`).
* **`disconnect`** *(System Cleanup)*
  * **Trigger Scene:** Driver disconnects from socket network.
  * **Behavior:** Server cleans up the active driver socket mapping entries.
* **`driver:location-update`** *(Inbound)*
  * **Trigger Scene:** Driver app streams real-time GPS coordinates periodically when online and completing a delivery task.
  * **Payload:**
    ```json
    {
      "orderId": "60d5ecb8b39d1b001f3e742f",
      "longitude": -0.760142,
      "latitude": 52.040622
    }
    ```
  * **Behavior:** Processes coordinates and updates driver location state, and relays location payload as `tracking:location` to the room `order:<orderId>`.
* **`order:assigned`** *(Outbound)*
  * **Trigger Scene:** Real-time dispatching alert emitted directly to driver's socket ID from server when a ready order is assigned.
  * **Payload:** Order details context (restaurant name, delivery locations).
* **`delivery:request`** / **`delivery:response`** *(Placeholder/Events)*
  * **Trigger Scene:** Handshake exchange events reserved for driver delivery proposals.

### B. FCM Push Notifications
* **`new_delivery_request`**
  * **Trigger Scene:** When an order transitions to `ready` state and is dispatched to a nearby driver, or assigned manually.
  * **Title:** `New Delivery Request`
  * **Body:** `Delivery from <restaurantName> — Order #<orderNumber>`
  * **Payload:** `{ orderId: "<id>", orderNumber: "<number>" }`
* **`driver_approved`**
  * **Trigger Scene:** Admin approves driver registration profile documents.
  * **Title:** `Driver Approved`
  * **Body:** `Your application has been approved. You can now start using the platform!`
  * **Payload:** None.
* **`driver_rejected`**
  * **Trigger Scene:** Admin rejects the driver application.
  * **Title:** `Driver Application Rejected`
  * **Body:** `Your application has been rejected. Reason: <reason>`
  * **Payload:** None.
* **`account_suspended`**
  * **Trigger Scene:** Admin suspends the driver's platform profile.
  * **Title:** `Account Suspended`
  * **Body:** `<reason>`
  * **Payload:** None.

---

## 🍳 4. Restaurant Owner Module

### A. Socket.io Events
* **`order:new`** *(Outbound)*
  * **Trigger Scene:** Emitters alert the restaurant owner instantly when a customer completes checkout.
  * **Payload:** New order details package.
* **`order:join`** / **`order:leave`**
  * **Trigger Scene:** Restaurant app enters or exits order processing list views.

### B. FCM Push Notifications
* **`order_placed`**
  * **Trigger Scene:** Emitted to restaurant owner when order status goes to `placed`.
  * **Title:** `New Order Received!`
  * **Body:** `Order #<orderNumber> — £<totalAmount>`
  * **Payload:** `{ orderId: "<id>", orderNumber: "<number>" }`
* **`order_cancelled`**
  * **Trigger Scene:** Customer or Admin cancels an order before kitchen preparation completes.
  * **Title:** `Order Cancelled`
  * **Body:** `Your order #<orderNumber> has been cancelled.`
  * **Payload:** `{ orderId: "<id>" }`
* **`restaurant_approved`**
  * **Trigger Scene:** Admin approves the restaurant listing application.
  * **Title:** `Restaurant Approved`
  * **Body:** `Your application has been approved. You can now start using the platform!`
  * **Payload:** None.
* **`restaurant_rejected`**
  * **Trigger Scene:** Admin rejects the restaurant listing application.
  * **Title:** `Restaurant Application Rejected`
  * **Body:** `Your application has been rejected. Reason: <reason>`
  * **Payload:** None.
* **`account_suspended`**
  * **Trigger Scene:** Admin suspends the restaurant owner's account.
  * **Title:** `Account Suspended`
  * **Body:** `<reason>`
  * **Payload:** None.
