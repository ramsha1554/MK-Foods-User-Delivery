Base URL: https://supplier-prewar-corrosive.ngrok-free.dev/api/v1

Workflow Steps:
1. Registration & Login:
- The user inputs their phone number at /auth/request-otp.
- The user submits the code to /auth/verify-otp. If the number is new, a user
profile is created automatically under the customer role.
2. Setup Address:
- Customers save delivery addresses using POST /addresses (including
longitude/latitude coordinates).
- One address is set as the default using PATCH /addresses/:id/default.
3. Discovery:
- Customer fetches open, approved restaurants within their radius via GET
/restaurants/nearby (requires GPS coordinates).
4. Ordering:
- Items are selected. App checks restaurant's minimum order requirement.
- For Cash on Delivery, the order is submitted immediately via POST /orders.
- For Card Payments: App requests Stripe PaymentIntent via POST
/payments/create-intent, confirms payment client-side via Stripe SDK,
and submits the order referencing the verified stripePaymentIntentId.
5. Real-time Tracking:
- App joins the Socket.io room order:<orderId> (event: order:join).
- Sockets listen to status changes (event: order:status-update) and GPS
coordinates of the driver (event: tracking:location).
6. Rating:
- Once order status hits delivered, customer submits reviews using POST
/ratings.
Relevant Endpoints:
- POST /auth/request-otp — Request OTP passcode.
- POST /auth/verify-otp — Verify OTP and receive JWT.
- GET /users/me — Fetch profile details.
- GET /addresses — List saved addresses.
- POST /addresses — Save new address.
- PATCH /addresses/:id/default — Set default address.
- GET /restaurants/nearby — Query nearby open restaurants.
- GET /restaurants/:id — Get restaurant profile and full menu.
- POST /payments/create-intent — Create Stripe PaymentIntent.
- POST /orders — Place order.
- GET /orders/my-orders — Customer order history.
- POST /orders/:id/cancel — Cancel placed order.
- POST /ratings — Review delivered order.

#### 🔌 Customer API Reference

---

### 1. Request OTP Passcode
* **URL:** `POST {{baseUrl}}/auth/request-otp`
* **Headers:**
  ```http
  Content-Type: application/json
  ```
* **Request Body:**
  ```json
  {
    "phone": "+447123456789",
    "role": "customer"
  }
  ```
  * `phone` *(string, required)*: Valid phone number matching E.164 format.
  * `role` *(string, optional)*: User registration role. Allowed values: `customer` *(default)*, `driver`, `admin`.
* **Responses:**
  * **Scenario A: Success (Development/Demo Mode)**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "OTP sent successfully",
        "data": {
          "message": "OTP sent successfully",
          "code": "000000"
        }
      }
      ```
  * **Scenario B: Success (Production Mode)**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "OTP sent successfully",
        "data": {
          "message": "OTP sent successfully"
        }
      }
      ```
  * **Scenario C: Validation Failure (Invalid Phone Format)**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Please provide a valid phone number (e.g. +447123456789)"
      }
      ```
  * **Scenario D: Rate Limit / Cooldown Exceeded**
    * **Status:** `429 Too Many Requests`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Maximum OTP requests exceeded. Please wait 5 minutes."
      }
      ```

---

### 2. Verify OTP & Receive JWT
* **URL:** `POST {{baseUrl}}/auth/verify-otp`
* **Headers:**
  ```http
  Content-Type: application/json
  ```
* **Request Body:**
  ```json
  {
    "phone": "+447123456789",
    "code": "000000"
  }
  ```
  * `phone` *(string, required)*: Associated verified phone number.
  * `code` *(string, required)*: Exactly 6-digit numeric OTP code.
* **Responses:**
  * **Scenario A: Success (New User / Auto-Registration)**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Authentication successful",
        "data": {
          "user": {
            "_id": "60d5ecb8b39d1b001f3e742c",
            "phone": "+447123456789",
            "name": null,
            "role": "customer",
            "isVerified": true,
            "isNewUser": true
          },
          "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
          "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
        }
      }
      ```
  * **Scenario B: Success (Existing User Login)**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Authentication successful",
        "data": {
          "user": {
            "_id": "60d5ecb8b39d1b001f3e742c",
            "phone": "+447123456789",
            "name": "John Doe",
            "role": "customer",
            "isVerified": true,
            "isNewUser": false
          },
          "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
          "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
        }
      }
      ```
  * **Scenario C: Validation Failure (Invalid OTP length/format)**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "OTP must be exactly 6 digits"
      }
      ```
  * **Scenario D: Incorrect / Expired OTP**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "OTP has expired or is invalid. Please request a new one."
      }
      ```
  * **Scenario E: Account Suspended**
    * **Status:** `403 Forbidden`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Your account has been suspended. Contact support."
      }
      ```

---

### 3. Fetch Profile Details
* **URL:** `GET {{baseUrl}}/users/me`
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
        "data": {
          "_id": "60d5ecb8b39d1b001f3e742c",
          "phone": "+447123456789",
          "name": "John Doe",
          "email": "johndoe@example.com",
          "role": "customer",
          "isVerified": true,
          "isActive": true,
          "createdAt": "2026-07-03T11:25:53.000Z",
          "updatedAt": "2026-07-03T11:28:35.000Z"
        }
      }
      ```
  * **Scenario B: Unauthorized (Missing or Expired Token)**
    * **Status:** `401 Unauthorized`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Token has expired. Please refresh your session."
      }
      ```

---

### 4. List Saved Addresses
* **URL:** `GET {{baseUrl}}/addresses`
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
            "_id": "60d5ecb8b39d1b001f3e743f",
            "user": "60d5ecb8b39d1b001f3e742c",
            "label": "Home",
            "fullAddress": "15 Midsummer Blvd, Milton Keynes MK9 3GB",
            "street": "Midsummer Blvd",
            "city": "Milton Keynes",
            "postcode": "MK9 3GB",
            "location": {
              "type": "Point",
              "coordinates": [-0.759423, 52.040612]
            },
            "isDefault": true,
            "deliveryInstructions": "Leave at doorstep",
            "createdAt": "2026-07-03T12:00:00.000Z",
            "updatedAt": "2026-07-03T12:00:00.000Z"
          }
        ]
      }
      ```
  * **Scenario B: Unauthorized**
    * **Status:** `401 Unauthorized`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Invalid token. Please log in again."
      }
      ```

---

### 5. Save New Address
* **URL:** `POST {{baseUrl}}/addresses`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  Content-Type: application/json
  ```
* **Request Body:**
  ```json
  {
    "label": "Office",
    "fullAddress": "Avebury Boulevard, Milton Keynes MK9 2EA",
    "street": "Avebury Blvd",
    "city": "Milton Keynes",
    "postcode": "MK9 2EA",
    "longitude": -0.760142,
    "latitude": 52.039841,
    "isDefault": false,
    "deliveryInstructions": "Leave at reception desk"
  }
  ```
  * `label` *(string, required)*: Label for the address (e.g. `Home`, `Office`, `Other`).
  * `fullAddress` *(string, required)*: Full string version of address.
  * `street` *(string, required)*: Street name.
  * `city` *(string, required)*: City name.
  * `postcode` *(string, required)*: Valid UK Postcode.
  * `longitude` *(number, required)*: Longitude coordinate (between -180 and 180).
  * `latitude` *(number, required)*: Latitude coordinate (between -90 and 90).
  * `isDefault` *(boolean, optional)*: Automatically sets as default address, clearing other default markers.
  * `deliveryInstructions` *(string, optional)*: Specific buzzer/dropoff notes.
* **Responses:**
  * **Scenario A: Success (Address Saved)**
    * **Status:** `201 Created`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Address saved",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e744f",
          "user": "60d5ecb8b39d1b001f3e742c",
          "label": "Office",
          "fullAddress": "Avebury Boulevard, Milton Keynes MK9 2EA",
          "street": "Avebury Blvd",
          "city": "Milton Keynes",
          "postcode": "MK9 2EA",
          "location": {
            "type": "Point",
            "coordinates": [-0.760142, 52.039841]
          },
          "isDefault": false,
          "deliveryInstructions": "Leave at reception desk",
          "createdAt": "2026-07-03T12:05:00.000Z",
          "updatedAt": "2026-07-03T12:05:00.000Z"
        }
      }
      ```
  * **Scenario B: Validation Failure (Missing Required Fields)**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Validation error: \"fullAddress\" is required"
      }
      ```

---

### 6. Set Default Address
* **URL:** `PATCH {{baseUrl}}/addresses/:id/default`
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
        "message": "Default address updated",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e744f",
          "user": "60d5ecb8b39d1b001f3e742c",
          "label": "Office",
          "isDefault": true,
          "createdAt": "2026-07-03T12:05:00.000Z",
          "updatedAt": "2026-07-03T12:10:00.000Z"
        }
      }
      ```
  * **Scenario B: Address Not Found or Belongs to Another User**
    * **Status:** `404 Not Found`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Address not found"
      }
      ```

---

### 7. Query Nearby Open Restaurants
* **URL:** `GET {{baseUrl}}/restaurants/nearby`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  ```
* **Query Parameters:**
  * `longitude` *(number, required)*: Customer's longitude GPS coordinate.
  * `latitude` *(number, required)*: Customer's latitude GPS coordinate.
  * `radius` *(number, optional)*: Maximum distance radius in kilometres *(default: 10)*.
  * `cuisine` *(string, optional)*: Filter by specific cuisine type.
  * `page` *(number, optional)*: Pagination page offset *(default: 1)*.
  * `limit` *(number, optional)*: Pagination size *(default: 20)*.
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
            "_id": "60d5ecb8b39d1b001f3e742c",
            "owner": "60d5ecb8b39d1b001f3e742a",
            "name": "Milton Keynes Pizzeria",
            "description": "Best stonebaked pizzas in MK",
            "cuisineType": ["Italian", "Pizza"],
            "phone": "+441908123456",
            "email": "pizza@example.com",
            "address": {
              "street": "12 Queensway",
              "city": "Milton Keynes",
              "postcode": "MK2 2HE"
            },
            "location": {
              "type": "Point",
              "coordinates": [-0.730245, 52.001248]
            },
            "minimumOrder": 15,
            "deliveryFee": 3.5,
            "preparationTime": 25,
            "operatingHours": {
              "monday": { "isOpen": true, "open": "12:00", "close": "23:00" }
            },
            "status": "approved",
            "isOpen": true,
            "isBusy": false,
            "averageRating": 4.5,
            "totalRatings": 12,
            "createdAt": "2026-07-03T11:00:00.000Z",
            "updatedAt": "2026-07-03T11:00:00.000Z"
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
  * **Scenario B: Validation Failure (Missing coordinates)**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Validation error: \"longitude\" is required; \"latitude\" is required"
      }
      ```

---

### 8. Get Restaurant Profile & Full Menu
* **URL:** `GET {{baseUrl}}/restaurants/:id`
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
        "data": {
          "restaurant": {
            "_id": "60d5ecb8b39d1b001f3e742c",
            "owner": {
              "_id": "60d5ecb8b39d1b001f3e742a",
              "name": "Owner Name",
              "phone": "+447999888777"
            },
            "name": "Milton Keynes Pizzeria",
            "description": "Best stonebaked pizzas in MK",
            "cuisineType": ["Italian", "Pizza"],
            "minimumOrder": 15,
            "deliveryFee": 3.5,
            "isOpen": true,
            "isBusy": false,
            "averageRating": 4.5,
            "totalRatings": 12
          },
          "menu": [
            {
              "_id": "60d5ecb8b39d1b001f3e743a",
              "name": "Pizzas",
              "description": "Stonebaked fresh pizzas",
              "sortOrder": 1,
              "items": [
                {
                  "_id": "60d5ecb8b39d1b001f3e742d",
                  "name": "Margherita",
                  "description": "Tomato sauce, mozzarella, fresh basil",
                  "price": 9.99,
                  "isAvailable": true,
                  "image": "http://localhost:5000/uploads/pizza.jpg",
                  "sortOrder": 1
                }
              ]
            }
          ]
        }
      }
      ```
  * **Scenario B: Restaurant Not Found**
    * **Status:** `404 Not Found`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Restaurant not foun d"
      }
      ```

---

### 9. Create Stripe PaymentIntent
* **URL:** `POST {{baseUrl}}/payments/create-intent`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  Content-Type: application/json
  ```
* **Request Body:**
  ```json
  {
    "orderId": "60d5ecb8b39d1b001f3e742f"
  }
  ```
  * `orderId` *(string, required)*: MongoDB ID of the placed order.
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Payment intent created",
        "data": {
          "clientSecret": "pi_3M324sFkdsfjksdfj_secret_dfj23k4j...",
          "paymentIntentId": "pi_3M324sFkdsfjksdfj"
        }
      }
      ```
  * **Scenario B: Order Not Found**
    * **Status:** `404 Not Found`
    - **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Order not found"
      }
      ```
  * **Scenario C: Not Authorised to Pay for Order**
    * **Status:** `403 Forbidden`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "You are not authorised to pay for this order."
      }
      ```
  * **Scenario D: Order Set to Cash Payment Method**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "This order is set to cash payment."
      }
      ```

---

### 10. Place Order
* **URL:** `POST {{baseUrl}}/orders`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  Content-Type: application/json
  ```
* **Request Body:**
  ```json
  {
    "restaurantId": "60d5ecb8b39d1b001f3e742c",
    "items": [
      {
        "menuItemId": "60d5ecb8b39d1b001f3e742d",
        "quantity": 2
      }
    ],
    "deliveryAddress": {
      "label": "Home",
      "fullAddress": "15 Midsummer Blvd, Milton Keynes MK9 3GB",
      "longitude": -0.759423,
      "latitude": 52.040612
    },
    "paymentMethod": "card",
    "stripePaymentIntentId": "pi_3M324sFkdsfjksdfj",
    "specialInstructions": "Leave at doorstep"
  }
  ```
  * `restaurantId` *(string, required)*: MongoDB ID of the restaurant.
  * `items` *(array, required)*: Cart items selection.
    * `menuItemId` *(string, required)*: MenuItem identifier.
    * `quantity` *(number, required)*: Integer >= 1.
  * `deliveryAddress` *(object, required)*: Destination coordinates and label.
  * `paymentMethod` *(string, required)*: Either `card` or `cash`.
  * `stripePaymentIntentId` *(string, conditional)*: Required if `paymentMethod` is `card`.
  * `specialInstructions` *(string, optional)*: Prep or delivery instructions.
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `201 Created`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Order placed successfully",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e742f",
          "orderNumber": "MK-20260703-0001",
          "customer": "60d5ecb8b39d1b001f3e742a",
          "restaurant": "60d5ecb8b39d1b001f3e742c",
          "items": [
            {
              "menuItem": "60d5ecb8b39d1b001f3e742d",
              "name": "Margherita",
              "price": 9.99,
              "quantity": 2,
              "itemTotal": 19.98
            }
          ],
          "subtotal": 19.98,
          "deliveryFee": 3.5,
          "platformFee": 3.0,
          "total": 23.48,
          "paymentMethod": "card",
          "paymentStatus": "paid",
          "status": "placed",
          "statusHistory": [
            {
              "status": "placed",
              "timestamp": "2026-07-03T12:10:00.000Z"
            }
          ],
          "deliveryAddress": {
            "label": "Home",
            "fullAddress": "15 Midsummer Blvd, Milton Keynes MK9 3GB",
            "location": {
              "type": "Point",
              "coordinates": [-0.759423, 52.040612]
            }
          },
          "specialInstructions": "Leave at doorstep",
          "createdAt": "2026-07-03T12:10:00.000Z"
        }
      }
      ```
  * **Scenario B: Restaurant Closed/Busy or Not Approved**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "This restaurant is not currently accepting orders."
      }
      ```
  * **Scenario C: Minimum Order Check Failed**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Minimum order value is £15.00. Your order is £9.99."
      }
      ```
  * **Scenario D: Sold Out Item Selected**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "\"Margherita\" is currently sold out."
      }
      ```

---

### 11. Customer Order History
* **URL:** `GET {{baseUrl}}/orders/my-orders`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  ```
* **Query Parameters:**
  * `page` *(number, optional)*: Pagination page offset *(default: 1)*.
  * `limit` *(number, optional)*: Pagination limit size *(default: 20)*.
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
              "name": "Milton Keynes Pizzeria",
              "logo": "http://localhost:5000/uploads/restaurant_logo.jpg"
            },
            "total": 23.48,
            "status": "placed",
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

### 12. Cancel Placed Order
* **URL:** `POST {{baseUrl}}/orders/:id/cancel`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  Content-Type: application/json
  ```
* **Request Body:**
  ```json
  {
    "reason": "Changed my mind"
  }
  ```
  * `reason` *(string, optional)*: Explanation for cancellation.
* **Responses:**
  * **Scenario A: Success (Order Cancelled)**
    * **Status:** `200 OK`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Order cancelled",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e742f",
          "orderNumber": "MK-20260703-0001",
          "status": "cancelled",
          "cancellationReason": "Changed my mind",
          "statusHistory": [
            {
              "status": "placed",
              "timestamp": "2026-07-03T12:10:00.000Z"
            },
            {
              "status": "cancelled",
              "timestamp": "2026-07-03T12:15:00.000Z",
              "note": "Changed my mind"
            }
          ]
        }
      }
      ```
  * **Scenario B: Transition Failure (Already Confirmed or Preparing by Kitchen)**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Cannot transition from 'confirmed' to 'cancelled'."
      }
      ```
  * **Scenario C: Order Not Found**
    * **Status:** `404 Not Found`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "Order not found"
      }
      ```

---

### 13. Review Delivered Order
* **URL:** `POST {{baseUrl}}/ratings`
* **Headers:**
  ```http
  Authorization: Bearer <accessToken>
  Content-Type: application/json
  ```
* **Request Body:**
  ```json
  {
    "orderId": "60d5ecb8b39d1b001f3e742f",
    "restaurantRating": 5,
    "driverRating": 4,
    "comment": "Quick delivery, hot food!"
  }
  ```
  * `orderId` *(string, required)*: MongoDB ID of the delivered order.
  * `restaurantRating` *(number, required)*: Rating score between 1 and 5.
  * `driverRating` *(number, optional)*: Rating score between 1 and 5.
  * `comment` *(string, optional)*: Textual review comments.
* **Responses:**
  * **Scenario A: Success**
    * **Status:** `201 Created`
    * **Body:**
      ```json
      {
        "success": true,
        "message": "Rating submitted",
        "data": {
          "_id": "60d5ecb8b39d1b001f3e7431",
          "order": "60d5ecb8b39d1b001f3e742f",
          "customer": "60d5ecb8b39d1b001f3e742a",
          "restaurant": "60d5ecb8b39d1b001f3e742c",
          "driver": "60d5ecb8b39d1b001f3e742e",
          "restaurantRating": 5,
          "driverRating": 4,
          "comment": "Quick delivery, hot food!",
          "createdAt": "2026-07-03T13:00:00.000Z"
        }
      }
      ```
  * **Scenario B: Rating Already Exists (Duplicate rating attempt)**
    * **Status:** `409 Conflict`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "You have already rated this order."
      }
      ```
  * **Scenario C: Order Status is Not Delivered**
    * **Status:** `400 Bad Request`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "You can only rate delivered orders."
      }
      ```
  * **Scenario D: Not Authorised (Attempting to rate someone else's order)**
    * **Status:** `403 Forbidden`
    * **Body:**
      ```json
      {
        "success": false,
        "status": "fail",
        "message": "You can only rate your own orders."
      }
      ```
