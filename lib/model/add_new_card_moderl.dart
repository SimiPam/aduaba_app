class AddNewCard {
  String cardHolderName;
  String cardNumber;
  String expiryDate;
  String ccv;

  AddNewCard({this.cardHolderName, this.cardNumber, this.expiryDate, this.ccv});

  AddNewCard.fromJson(Map<String, dynamic> json) {
    cardHolderName = json['cardHolderName'];
    cardNumber = json['cardNumber'];
    expiryDate = json['expiryDate'];
    ccv = json['ccv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardHolderName'] = this.cardHolderName;
    data['cardNumber'] = this.cardNumber;
    data['expiryDate'] = this.expiryDate;
    data['ccv'] = this.ccv;
    return data;
  }
}
