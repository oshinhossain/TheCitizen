class RequestNewSubCategory {
  String id;
  String requestDate;
  String categoryName;
  String requestedSubCategory;
  String status;
  String description;
  RequestNewSubCategory(this.id, this.requestDate, this.categoryName, this.requestedSubCategory, this.status, this.description);

  static List<RequestNewSubCategory> fetchAll() {
    return [
      RequestNewSubCategory("1", "16 Aug 2022", "Disturbance", "Harassment in public transport", "Pending",
          "All kinds of complaint regarding harassment in public transport will be listed here."),
      RequestNewSubCategory("2", "12 Jul 2022", "Pollution", "Noise pollution", "Approved",
          "All kinds of complaint regarding harassment in public transport will be listed here."),
      RequestNewSubCategory("3", "16 Jun 2022", "Water", "Water pollution", "Pending",
          "All kinds of complaint regarding harassment in public transport will be listed here."),
      RequestNewSubCategory("4", "12 May 2022", "Pollution", "Blockage in drainage system", "Rejected",
          "All kinds of complaint regarding harassment in public transport will be listed here."),
      RequestNewSubCategory("5", "15 Mar 2022", "Food Contamination", "Food high price", "Pending",
          "All kinds of complaint regarding harassment in public transport will be listed here."),
    ];
  }
}
