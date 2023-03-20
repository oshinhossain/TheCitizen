class EmployeeServiceGridItem {
  // final Function? onTap;
  final String? themeColor;
  final String? imagePath;
  final String? titleText;

  EmployeeServiceGridItem({
    // required this.onTap,
    required this.themeColor,
    required this.imagePath,
    required this.titleText,
  });

  static final employeeServiceGridItem = [
    EmployeeServiceGridItem(
      // onTap: onTap,
      themeColor: '2F8F9D',
      imagePath: 'assets/images/time_management.png',
      titleText: 'Time Management',
    ),
    EmployeeServiceGridItem(
      // onTap: onTap,
      themeColor: '2F8F9D',
      imagePath: 'assets/images/travelling.png',
      titleText: 'Traveling',
    ),
    EmployeeServiceGridItem(
      // onTap: onTap,
      themeColor: '2F8F9D',
      imagePath: 'assets/images/expenses.png',
      titleText: 'Expenses',
    ),
    EmployeeServiceGridItem(
      // onTap: onTap,
      themeColor: '2F8F9D',
      imagePath: 'assets/images/loan_application.png',
      titleText: 'Loan Management',
    ),
  ];
}
