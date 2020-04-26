import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel/data/HotelData.dart';
import 'package:hotel/models/Hotel.dart';

class HotelBooking extends StatefulWidget {
  @override
  _HotelBookingState createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  @override
  Widget build(BuildContext context) {
    //Getting the size of smarthpone screen.
    Size screenSize = MediaQuery.of(context).size;
    bool isIoS = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          children: <Widget>[
            _TopNavigator(),
            Expanded(
              child: ListView.builder(
                padding: new EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: hotels.length,
                itemBuilder: (_, int index) => _cardBuild(screenSize, hotels[index]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardBuild(Size screenSize, Hotel item) {
    return Padding(
      padding: new EdgeInsets.only(top: 15.0),
      child: Container(
        height: 280,
        width: screenSize.width,
        child: Card(
          elevation: 8.0,
          margin: EdgeInsets.all(0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 190.0,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(item.img),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: new EdgeInsets.symmetric(horizontal: 10.0),
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'Hong Kong Island',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.0),
                              Row(
                                children: <Widget>[
                                  RatingBarIndicator(
                                    rating: item.reviews,
                                    itemCount: 5,
                                    itemSize: 18.0,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  Text(
                                    '4/5 reviews',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "\$ ${item.price}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Per Night',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              _FavoriteButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 15,
      bottom: 70,
      child: Container(
        height: 42.0,
        width: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[800],
              Colors.blue[700],
              Colors.blue[300],
            ],
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}

class _TopNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue[800],
              Colors.blue[700],
              Colors.blue[600],
              Colors.blue[400],
              Colors.blue[300],
            ],
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hong Kong',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        'Nov 28 - Nov 30 * 1 room, 2 adult ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.swap_vert, color: Colors.white, size: 28),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.filter_list, color: Colors.white, size: 28),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
