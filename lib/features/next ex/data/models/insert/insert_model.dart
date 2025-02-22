class InsertModel {

    final String recievedCurrencyId;
    final String countryIdFrom;
    final String recievedBranchId;
    final String recievedName;
    final String rPhone1;
    final String cityIdTo;
    final String deliveredCurrencyId;
    final String countryIdTo;
    final String serviceType;
    final String currRecievedVal;
    final String accFrom;
    final String ownAccNo;
    InsertModel({
        required this.recievedCurrencyId,
        required this.countryIdFrom,
        required this.recievedBranchId,
        required this.recievedName,
        required this.rPhone1,
        required this.cityIdTo,
        required this.deliveredCurrencyId,
        required this.countryIdTo,
        required this.serviceType,
        required this.currRecievedVal,
        required this.accFrom,
        required this.ownAccNo,
    });

    factory InsertModel.fromJson(jsonData){ 
        return InsertModel(
            recievedCurrencyId: jsonData["RecievedCurrencyID"] ?? '',
            countryIdFrom: jsonData["CountryIDFrom"] ?? '0',
            recievedBranchId: jsonData["RecievedBranchID"] ?? '',
            recievedName: jsonData["RecievedName"] ?? "",
            rPhone1: jsonData["RPhone1"] ?? "",
            cityIdTo: jsonData["CityIDTo"] ?? '',
            deliveredCurrencyId: jsonData["DeliveredCurrencyID"] ?? '',
            countryIdTo: jsonData["CountryIDTo"] ?? '',
            serviceType: jsonData["ServiceType"] ?? '',
            currRecievedVal: jsonData["CurrRecievedVal"] ?? '',
            accFrom: jsonData["AccFrom"] ?? '',
            ownAccNo: jsonData["OwnAccNo"] ?? "Null",
        );
    }

}
