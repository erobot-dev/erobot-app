import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:erobot_app/validation/validation.dart';
import 'package:erobot_app/object_class/classes.dart';

class JoinUs extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Join Us',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior()
          ..buildViewportChrome(context, null, AxisDirection.down),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              'Want to be a member?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              'Please enter your info',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            CircleAvatar(
              backgroundColor: Hexcolor('03a0b0'),
              radius: 55,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                backgroundImage: AssetImage('assets/blank-profile-picture.png'),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.442,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.only(bottom: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "First Name",
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.6)),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 5, 20, 0)),
                            validator: (val) {
                              RequestMember.firstName = val;
                              if (val.isEmpty)
                                return 'Enter your first name';
                              else
                                return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.442,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.only(bottom: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Last name',
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.6)),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 5, 20, 0)),
                            validator: (val) {
                              RequestMember.lastName = val;
                              if (val.isEmpty)
                                return 'Enter your last name';
                              else
                                return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Enter your email address',
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                            contentPadding: EdgeInsets.fromLTRB(10, 5, 20, 0)),
                        validator: (val) {
                          RequestMember.email = val;
                          return validateEmail(val);
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Please introduces yourself',
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                            contentPadding: EdgeInsets.fromLTRB(10, 5, 20, 0)),
                        validator: (val) {
                          RequestMember.memberInfo = val;
                          if (val.isEmpty)
                            return 'Please introduces yourself';
                          else
                            return null;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Why do you want to join us?',
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                            contentPadding: EdgeInsets.fromLTRB(10, 5, 20, 0)),
                        validator: (val) {
                          RequestMember.firstName = val;
                          if (val.isEmpty)
                            return 'Please answer the question';
                          else
                            return null;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Hexcolor('03a0b0')),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          splashColor: Color.fromRGBO(255, 255, 255, .2),
                          child: Center(
                            child: Text(
                              'Submit',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print(
                                  'Entered validation\nFirstName: ${RequestMember.firstName}');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text(
                'Your applicant will be reviewed by our team leader within 7 days',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
