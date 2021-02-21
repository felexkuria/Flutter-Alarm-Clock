import 'package:clock_app/widgets/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:intl';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    final DateFormat timeFormat = DateFormat('Hms');
    final DateFormat dateFormat = DateFormat('EEE,d MMM');
    final String timeZoneString =
        dateTime.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timeZoneString.startsWith('-')) {
      offsetSign = '+';
      print(timeZoneString);
    }

    return Scaffold(
      backgroundColor: Color(0xFF2d2f41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMenuButton(
                  title: 'Clock', image: 'assets/images/clock_icon.png'),
              buildMenuButton(
                  title: 'Alarm', image: 'assets/images/alarm_icon.png'),
              buildMenuButton(
                  title: 'Timer', image: 'assets/images/timer_icon.png'),
              buildMenuButton(
                  title: 'StopWatch',
                  image: 'assets/images/stopwatch_icon.png'),
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
              alignment: Alignment.center,
              color: Color(0xFF2d2f41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Clock',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Avenir-Light',
                      fontSize: 24.0,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timeFormat.format(dateTime),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Avenir-Light',
                            fontSize: 64.0,
                          ),
                        ),
                        Text(
                          dateFormat.format(dateTime),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Avenir-Light',
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                          size: MediaQuery.of(context).size.height / 4),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TimeZone',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Avenir-Medium',
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              'UTC' + offsetSign + timeZoneString,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Avenir-Light',
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton({String title, String image}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(
              image,
              scale: 1.5,
            ),
            SizedBox(height: 16.0),
            Text(
              title ?? '',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Avenir-Heavy',
                  fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
