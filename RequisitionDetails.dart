import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fabhr/utils/customIcon.dart';
import 'package:flutter/widgets.dart';

class RequisitionDetails {
  static List<RequisitionProduct> _requisitionProduct = [
    RequisitionProduct('Final Chip Low Grade', 'USD', '340', '10', '180'),
    RequisitionProduct('Final Chip Med Grade', 'USD', '1000', '40', '575')
  ];

  static List<AttachmentList> _attachmentList = [
    AttachmentList(
      'Spendings.pdf',
    ),
    AttachmentList(
      'PriceList.jpeg',
    ),
    AttachmentList(
      'PriceList.jpeg',
    )
  ];

  void init(context) {
    _showRequisitionDetails(context);
  }

  _showRequisitionDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            content: dialogContent(context));
      },
    );
  }

  dialogContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            size: 24,
            color: Color.fromRGBO(185, 192, 202, 1.0),
          ),
          padding:
              EdgeInsets.only(top: 19.4, left: 14, right: 5.4, bottom: 5.4),
        ),
        Container(
          padding: EdgeInsets.only(top: 4, right: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'USD 1340',
                style: TextStyle(
                    fontFamily: 'FSMatthew-Medium',
                    fontSize: 22,
                    letterSpacing: 0.05,
                    color: Color.fromRGBO(2, 113, 218, 1.0)),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.only(top: 14, left: 14, right: 17),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Manuel Roberson',
                        style: TextStyle(
                            fontFamily: 'FSMatthew-Medium',
                            fontSize: 18,
                            letterSpacing: 0.04,
                            color: Color.fromRGBO(12, 35, 64, 1.0)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 9),
                      child: Text(
                        'Request for Lorem ipsum dolor sit amet, ridens menandri electram ius eu.',
                        style: TextStyle(
                            fontFamily: 'FSMatthew',
                            letterSpacing: 0.14,
                            fontSize: 14,
                            color: Color.fromRGBO(100, 121, 149, 1.0)),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          _showRequestionInfo('Number', 'FAB-BNK-234234'),
                          _showRequestionInfo('Issued', '09 Dec 2019'),
                          _showRequestionInfo('Last Approved', 'Joshi Mathew'),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Color.fromRGBO(185, 192, 202, 1.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Column(
                          children: _requisitionProduct
                              .asMap()
                              .map((i, data) => MapEntry(
                                  i, _showRequisitionProperty(i, data)))
                              .values
                              .toList()),
                    ),
                    SizedBox(
                      height: 21.5,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(1.1, 4.9, 10.8, 4.9),
                            child: Icon(
                              Icons.attachment,
                              size: 16.5,
                              color: Color.fromRGBO(100, 121, 149, 1.0),
                            ),
                          ),
                          Text(
                            'Attachments',
                            style: TextStyle(
                                fontFamily: 'FSMatthew',
                                fontSize: 15,
                                color: Color.fromRGBO(100, 121, 149, 1.0),
                                letterSpacing: 0.03),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: _attachmentList
                            .map((element) => _generateAttachmentList(element))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 31,
                    ),
                    _showApprovalHistory(),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              )),
        ),
        _showActionButtons(),
      ],
    );
  }

  Container _showRequestionInfo(fieldName, value) {
    return Container(
      margin: EdgeInsets.only(bottom: 11),
      padding: EdgeInsets.only(left: 10, bottom: 5, top: 5),
      color: Color.fromRGBO(240, 245, 252, 1.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(fieldName,
                style: TextStyle(
                    fontFamily: 'FSMatthew-Medium',
                    fontSize: 14,
                    letterSpacing: 0.03,
                    color: Color.fromRGBO(12, 35, 64, 1.0))),
          ),
          Container(
            width: 2,
            padding: EdgeInsets.symmetric(vertical: 7),
            color: Color.fromRGBO(185, 192, 202, 1.0),
            margin: EdgeInsets.only(right: 8),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                  fontFamily: 'FSMatthew',
                  fontSize: 14,
                  color: Color.fromRGBO(100, 121, 149, 1.0),
                  letterSpacing: 0.03),
            ),
          )
        ],
      ),
    );
  }

  Container _showRequisitionProperty(
      int index, RequisitionProduct requisitionProduct) {
    return Container(
        padding: EdgeInsets.only(top: 13),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  (index + 1).toString() + '.',
                  style: TextStyle(
                      fontFamily: 'FSMatthew-Medium',
                      fontSize: 14,
                      letterSpacing: 0.03,
                      color: Color.fromRGBO(12, 35, 64, 1.0)),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    'Final Chip Low Grade',
                    style: TextStyle(
                        fontFamily: 'FSMatthew',
                        fontSize: 16,
                        letterSpacing: 0.04,
                        color: Color.fromRGBO(12, 35, 64, 1.0)),
                  ),
                ),
                Text('USD 340',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'FSMatthew',
                        fontSize: 14,
                        letterSpacing: 0.03,
                        color: Color.fromRGBO(2, 113, 218, 1.0)))
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Qty: ',
                        style: TextStyle(
                            fontFamily: 'FSMatthew',
                            fontSize: 12,
                            letterSpacing: 0.03,
                            color: Color.fromRGBO(12, 35, 64, 1.0)),
                      ),
                      Text(
                        '40 Each',
                        style: TextStyle(
                            fontFamily: 'FSMatthew',
                            fontSize: 12,
                            letterSpacing: 0.03,
                            color: Color.fromRGBO(100, 121, 149, 1.0)),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 22),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Unit price: ',
                        style: TextStyle(
                            fontFamily: 'FSMatthew',
                            fontSize: 12,
                            letterSpacing: 0.03,
                            color: Color.fromRGBO(12, 35, 64, 1.0)),
                      ),
                      Text(
                        '180',
                        style: TextStyle(
                            fontFamily: 'FSMatthew',
                            fontSize: 12,
                            letterSpacing: 0.03,
                            color: Color.fromRGBO(100, 121, 149, 1.0)),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12.5,
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(185, 192, 202, 1.0),
            ),
          ],
        ));
  }

  Container _generateAttachmentList(AttachmentList _attachmentList) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
          color: Color.fromRGBO(244, 248, 253, 1.0),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.only(left: 9, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(_attachmentList.name,
              style: TextStyle(
                  fontFamily: 'FSMatthew-Light',
                  fontSize: 14,
                  color: Color.fromRGBO(2, 113, 218, 1.0),
                  letterSpacing: 0.03)),
          Padding(
            padding: EdgeInsets.fromLTRB(3.1, 1.3, 3.5, 1.3),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 15,
              color: Color.fromRGBO(100, 121, 149, 1.0),
            ),
          ),
        ],
      ),
    );
  }

  Container _showApprovalHistory() {
    return Container(
      padding: EdgeInsets.only(left: 13, top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color.fromRGBO(244, 248, 253, 1.0)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(1.7, 3, 15, 3),
            child: Icon(
              Icons.update,
              size: 20.3,
              color: Color.fromRGBO(100, 121, 149, 1.0),
            ),
          ),
          Text(
            'Approval history',
            style: TextStyle(
                fontFamily: 'FSMatthew',
                fontSize: 14,
                letterSpacing: 0.03,
                color: Color.fromRGBO(100, 121, 149, 1.0)),
          )
        ],
      ),
    );
  }

  Container _showActionButtons() {
    Expanded approveButton = Expanded(
      flex: 3,
      child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0)),
        padding: EdgeInsets.symmetric(vertical: 17),
        color: Color.fromRGBO(0, 43, 122, 1.0),
        child: Text("Approve",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'FSMatthew',
                fontSize: 16,
                letterSpacing: 0.04,
                color: Color.fromRGBO(255, 255, 255, 1.0))),
        onPressed: () {},
      ),
    );

    Expanded rejectButton = Expanded(
      flex: 2,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 17),
        shape: new RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: Color.fromRGBO(0, 43, 122, 1.0)),
            borderRadius: new BorderRadius.circular(7.0)),
        child: Text(
          "Reject",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'FSMatthew',
              fontSize: 16,
              letterSpacing: 0.04,
              color: Color.fromRGBO(0, 43, 122, 1.0)),
        ),
        onPressed: () {},
      ),
    );
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(246, 249, 252, 1.0),
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(top: 19, bottom: 19, left: 13, right: 17),
      child: Row(
        children: <Widget>[
          approveButton,
          SizedBox(
            width: 16,
          ),
          rejectButton,
        ],
      ),
    );
  }
}

class RequisitionProduct {
  String name;
  String currency;
  String amount;
  String quantity;
  String unit;
  RequisitionProduct(
      this.name, this.currency, this.amount, this.quantity, this.unit);
}

class AttachmentList {
  String name;
  AttachmentList(this.name);
}
