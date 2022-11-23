import 'package:flutter/material.dart';

class FondoLogin extends StatelessWidget {
  final Widget child;

  const FondoLogin({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.red,
      child: Stack(
        children: [
          _PurpleBox(),
          SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              child: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          this.child,
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      //color: Colors.indigo,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 69, 100, 224),
            Color.fromARGB(255, 106, 40, 222),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: _Esfera(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Esfera(),
            top: 90,
            left: 280,
          ),
          Positioned(
            child: _Esfera(),
            bottom: 110,
            left: 200,
          ),
          Positioned(
            child: _Esfera(),
            bottom: 110,
            left: 110,
          ),
        ],
      ),
    );
  }
}

class _Esfera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
