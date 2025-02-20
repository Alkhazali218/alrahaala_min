class InsertModel {

    final String recievedCurrencyId;
    final String countryIdFrom;
    final int recievedBranchId;
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
            recievedCurrencyId: jsonData["RecievedCurrencyID"] ?? '0',
            countryIdFrom: jsonData["CountryIDFrom"] ?? '0',
            recievedBranchId: jsonData["RecievedBranchID"] ?? '0',
            recievedName: jsonData["RecievedName"] ?? "",
            rPhone1: jsonData["RPhone1"] ?? "",
            cityIdTo: jsonData["CityIDTo"] ?? '0',
            deliveredCurrencyId: jsonData["DeliveredCurrencyID"] ?? '0',
            countryIdTo: jsonData["CountryIDTo"] ?? '0',
            serviceType: jsonData["ServiceType"] ?? '0',
            currRecievedVal: jsonData["CurrRecievedVal"] ?? '0',
            accFrom: jsonData["AccFrom"] ?? '0',
            ownAccNo: jsonData["OwnAccNo"] ?? "Null",
        );
    }

}
