<img width="388" height="771" alt="Screenshot 2026-09-18 at 1 50 13 PM" src="https://github.com/user-attachments/assets/54244be2-3adc-4594-93e6-e95aa76b60a1" />
<img width="387" height="775" alt="Screenshot 2026-09-18 at 1 50 43 PM" src="https://github.com/user-attachments/assets/41414161-33c3-4403-b717-467c64c1ffaa" />

# DrinkDash

A modern drink ordering iOS application built with **SwiftUI**. DrinkDash focuses on a clean, animated shopping experience where users can browse drinks, customize their order, and receive a beautifully designed digital receipt.

The project was built with a modular structure using **MVVM**, reusable SwiftUI components, custom animations, and a centralized design system.

---

## Features

- Browse multiple drinks with an interactive carousel
- Image-based swipe gesture for changing drinks
- Animated drink transitions
- Individual background colors for each drink
- Custom drink imagery
- Responsive SwiftUI layouts
- Product detail screen
- Select drink size
- ➕➖ Adjust quantity
- Automatic order total calculation
- Animated receipt screen
- Custom receipt shape with perforated edges
- "Place Another Order" navigation
- Smooth UI transitions and animations
- Reusable custom components
- MVVM-based project organization

---

## App Flow

```text
Home
  │
  ├── Browse Drinks
  │
  ├── Swipe on Drink Image
  │       ↓
  │   Change Product
  │
  └── Select Drink
          ↓
    Product Detail
          │
          ├── Select Size
          ├── Change Quantity
          └── Order Now
                  ↓
              Receipt
                  │
                  └── Place Another Order
                          ↓
                         Home
````

---

## Main Screens

### Home

The Home screen introduces the available drinks through an interactive product carousel.

Users can:

* View the current drink
* Preview the next drink
* Swipe directly on the drink image
* View drink name and subtitle
* View the current price
* Access the product detail screen

---

### Product Detail

The Product Detail screen provides the complete ordering experience.

Users can:

* View a large drink presentation
* Read the product description
* Select a drink size
* Increase or decrease quantity
* View the calculated total
* Place the order

---

### Receipt

After placing an order, DrinkDash presents an animated receipt.

The receipt displays:

* Receipt title
* Product name
* Selected size
* Quantity
* Unit price
* Total price
* Developer credit
* Thank-you message
* Place Another Order button

The Home screen can only be reached from the receipt through the **Place Another Order** button.

---

## Architecture

DrinkDash follows the **Model-View-ViewModel (MVVM)** architecture.

```text
Models
   ↓
ViewModels
   ↓
Views
   ↓
Reusable Components
```

## Project Structure

```text
DrinkDash/
│
├── DrinkDashApp.swift
│
├── App/
│   ├── AppRouter.swift
│   └── AppScreen.swift
│
├── Models/
│   ├── Product.swift
│   ├── ProductSize.swift
│   ├── CartItem.swift
│   └── Order.swift
│
├── ViewModels/
│   ├── HomeViewModel.swift
│   ├── ProductDetailViewModel.swift
│   └── OrderViewModel.swift
│
├── Components/
│   ├── WeekendLogoView.swift
│   ├── ProductImageView.swift
│   ├── PrimaryButton.swift
│   ├── PriceView.swift
│   └── ReceiptShape.swift
│
├── DesignSystem/
│   ├── AppColors.swift
│   ├── AppTypography.swift
│   ├── AppSpacing.swift
│   ├── AppRadius.swift
│   └── AppMotion.swift
│
├── Views/
│   ├── Home/
│   │   ├── HomeView.swift
│   │   ├── ProductCarouselView.swift
│   │   └── ProductHeroView.swift
│   │
│   ├── ProductDetail/
│   │   ├── ProductDetailView.swift
│   │   ├── SizeSelectorView.swift
│   │   └── QuantitySelectorView.swift
│   │
│   └── Order/
│       ├── OrderConfirmationView.swift
│       └── ReceiptView.swift
│
└── Preview/
    └── PreviewData.swift
```

---


## Ordering Logic

The ordering process is handled through the product detail and order view models.

```text
Product
   ↓
Select Size
   ↓
Select Quantity
   ↓
Calculate Total
   ↓
Create Order
   ↓
Receipt
```

The final order contains information such as:

* Product
* Size
* Quantity
* Unit price
* Total
* Creation date

---

## Technologies

* **Swift**
* **SwiftUI**
* **Xcode**
* **MVVM Architecture**

---

## Project Goals

DrinkDash was created to practice and demonstrate:

* SwiftUI UI development
* MVVM architecture
* State-driven interfaces
* Reusable components
* Custom design systems
* Gesture handling
* Animation
* Navigation
* Dynamic pricing
* Order modeling
* Professional project organization

---

## Future Improvements

Possible future improvements include:

* [ ] Persistent cart
* [ ] User accounts
* [ ] Backend integration
* [ ] Real payment processing
* [ ] Order history
* [ ] Favorites
* [ ] Search and filtering
* [ ] Remote product data
* [ ] Network image loading
* [ ] Real-time order tracking
* [ ] Haptic feedback
* [ ] Accessibility improvements
* [ ] Unit and UI testing

---

## Developer

**DevTechZahid (Muhammad Zahid Khan )**

Built with SwiftUI and a focus on clean architecture, reusable components, modern UI design, and smooth interactions.

