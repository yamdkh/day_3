### Day One: Flutter UI Basics

---

### **Slides Session:**

- The **TA** will introduce Flutter and explain how it works, covering its main features and why it's a popular choice for cross-platform development.
- The session will focus on **Flutter layouts**:
    - The **Row** and **Column** widgets.
    - How to arrange UI elements vertically and horizontally.
- The **TA** will use slides to explain the concepts and show examples of Flutter code for layout building.

---

### **Practical Session:**

- The **TA** will live code a **Personal Profile App**:
    - Displaying a profile picture, name, and a short bio.
    - Explaining the usage of `Container`, `Column`, `Row`, `Text`, and `Image` widgets.
- The **TA** will guide students step-by-step on how to build the app and customize it.

---

### **On-Hands Session:**

- Students will create a **Personal Profile Card** on their own:
    - They will apply what they learned to build a card with a profile picture, name, and a description.
    - They will focus on practicing layout skills using `Row`, `Column`, and `Container` widgets.

---

### Day Two: **Handling State in Flutter**

---

### **Slides Session:**

- The **TA** will begin by explaining the concept of state in Flutter, emphasizing its role in creating interactive and dynamic apps.
- **Topics Covered**:
    - **StatefulWidget**:
        - Difference between `StatelessWidget` and `StatefulWidget`.
        - When to use `StatefulWidget` in Flutter applications.
    - **Managing State**:
        - Explanation of how `setState` works to rebuild the UI when data changes.
        - Using a counter app as an example to illustrate the concept of state.

  **Counter App Explanation**:

    - **Overview**: A simple app that displays a number and a button. Each time the button is pressed, the number increases.
    - **Key Widgets**:
        - `StatefulWidget`: The app needs to store and modify the count, so it requires a stateful widget.
        - `Text`: Displays the current count.
        - `ElevatedButton`: When pressed, it calls `setState` to increase the counter.
    - **Code Walkthrough**:
        - Declaring a `StatefulWidget` to hold the count state.
        - Implementing the `setState` function to update the count and refresh the UI.
        - Using `Text` to display the count and `ElevatedButton` to increment it.
- The **TA** will display code snippets and explain how the counter app works step-by-step, helping students grasp the basics of state management in Flutter.

---

### **Practical Session:**

- The **TA** will implement a **Simple To-Do App** live:
    - Create a to-do list where users can add tasks using a `TextField` and an `ElevatedButton`.
    - Manage the list of tasks by updating the UI when the user adds a new task.
    - Use `setState` to rebuild the UI when the list of tasks is updated.
    - Teach how to handle button clicks and update the state to reflect the changes in the app.

**Code Walkthrough**:

- How to declare a `StatefulWidget` and use `setState`.
- Managing a list of tasks and displaying them using `ListView`.
- Styling the UI with basic padding and spacing.

---

### **On-Hands Session:**

- **Project**: **Favorite Color App**
    - **Description**: Students will create a simple app where they can choose their favorite color from a list and display it on the screen.
    - **Implementation Steps**:
        - Display the selected color in a `Text` widget.
        - Use `setState` to update the displayed color when the user makes a new selection.
    - **Key Widgets**: `DropdownButton`, `Text`, `setState`.

This simple app focuses on allowing students to practice handling user input and updating the state based on their selection, without duplicating the To-Do App.

---

### Day Three: **Navigation & Lists in Flutter**

---

### **Slides Session:**

- The **TA** will introduce the concept of **multiple screens and navigation** in Flutter.**Code Examples**:
    - **Topics Covered**:
        - Navigating between different screens using `Navigator.push` and `Navigator.pop`.
        - Introduction to `ListView` and `GridView` for displaying data in lists or grids.
        - How to handle lists of data and display them dynamically in a Flutter app.
    - Example showing how to navigate between two screens.
    - Simple use of `ListView` to display a list of items, and `GridView` to show items in a grid layout.
    - Explanation of handling large amounts of data using `ListView.builder` for efficient rendering.

---

### **Practical Session:**

- The **TA** will implement a **Product List App** live:
    - Display a list of products using `ListView.builder` and show how to navigate to a product details page when an item is clicked.
    - Demonstrate how to pass data between screens (e.g., passing product information from the list to the details screen).
    - Use a basic `GridView` to display products in a grid layout.
    - Explain how to style the list items and grids to create visually appealing layouts.

**Code Walkthrough**:

- Navigation with `Navigator.push` to move between screens.
- Creating a list of products using `ListView.builder`.
- Using `GridView` to display items in a grid layout.
- Managing state when passing data between screens.

---

### **On-Hands Session:**

- **Project**: **Simple Contact List App**
    - **Description**: Students will build a contact list where they display a list of names and can navigate to a details screen for each contact.
    - **Implementation Steps**:
        - Create a list of contacts using `ListView.builder`.
        - Navigate to a details screen when a contact is tapped.
        - Pass the contact’s name and details to the new screen.
    - **Key Widgets**: `ListView.builder`, `Navigator.push`, `Text`, `Scaffold`.

This structure for Day 3 introduces students to navigating between screens and handling lists of data, which are essential for building scalable, interactive apps.

---

### Day Four: **Connecting to APIs and Final Project**

---

### **Slides Session:**

- The **TA** will explain how to connect Flutter apps to external APIs and fetch live data.**Code Examples**:
    - **Topics Covered**:
        - Using the `http` package to send network requests.
        - Fetching and decoding JSON data from an API.
        - Displaying live data dynamically within the app.
        - (Optional) Basic animations and transitions to enhance UI.
    - Step-by-step example showing how to fetch data from an API and parse the response.
    - Explanation of `FutureBuilder` for handling asynchronous data and updating the UI.

---

### **Practical Session:**

- The **TA** will demonstrate an **App that Fetches Random Jokes**:
    - The app will use the `http` package to fetch random jokes from an API.
    - The jokes will be displayed one at a time, and users can press a button to load a new joke.
    - This session will teach how to fetch data from an API, handle asynchronous operations, and update the UI using `setState` and `FutureBuilder`.
    - The app will also include error handling for failed API requests.

**Code Walkthrough**:

- How to send GET requests using the `http` package.
- Parsing JSON responses and updating the UI dynamically.
- Using `FutureBuilder` to manage asynchronous data fetching.
- (Optional) Adding animations to transition between jokes smoothly.

---

### **On-Hands Session:**

- **Project**: **News App**
    - **Description**: Students will build a basic news app that fetches news articles from a public API and displays them in a list.
    - **Implementation Steps**:
        - Use the `http` package to fetch news articles from a public news API (e.g., NewsAPI or any similar service).
        - Display the news articles in a `ListView` or `ListView.builder` with each article showing the headline and a brief description.
        - Implement navigation so that when a user taps on a news item, it navigates to a new screen showing more details about the article (e.g., full content or link to the full article).
        - Optionally, add a "loading" animation while the data is being fetched.
    - **Key Widgets**: `FutureBuilder`, `ListView.builder`, `Navigator.push`, `Card`, `http`.
    - 