import 'package:flutter/material.dart';

class MForm extends StatefulWidget {
  const MForm({Key? key}) : super(key: key);

  @override
  _MFormState createState() => _MFormState();
}

class _MFormState extends State<MForm> {
  String _radioValue = "";
  String _radioTile = "";
  bool? _selectVal = false;
  double _val = 0.0;
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.green),
          ),
          child: Column(
            children: [
              Text("$w"),
              Radio(
                  value: "男",
                  groupValue: _radioValue,
                  activeColor: Colors.pink,
                  fillColor: MaterialStateColor.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.green;
                    } else {
                      return Colors.orange;
                    }
                  }),
                  onChanged: (String? val) {
                    setState(() {
                      _radioValue = val ?? '';
                    });
                  }),
              Radio(
                  value: "女",
                  groupValue: _radioValue,
                  activeColor: Colors.pink,
                  // fillColor: MaterialStateColor.resolveWith(
                  //     (Set<MaterialState> states) {
                  //   if (states.contains(MaterialState.pressed)) {
                  //     return Colors.green;
                  //   } else {
                  //     return Colors.orange;
                  //   }
                  // }),
                  onChanged: (String? val) {
                    setState(() {
                      _radioValue = val ?? '';
                    });
                  }),
              RadioListTile(
                value: "语文",
                title: const Text("语文"),
                subtitle: const Text("这是语文的subTitle"),
                groupValue: _radioTile,
                tileColor: Colors.blue,
                selectedTileColor: Colors.yellow,
                activeColor: Colors.pink,
                contentPadding: const EdgeInsets.all(4.0),
                onChanged: (String? val) {
                  setState(() {
                    _radioTile = val ?? '';
                  });
                },
              ),
              RadioListTile(
                value: "数学",
                title: const Text("数学"),
                subtitle: const Text("这是数学的subTitle"),
                groupValue: _radioTile,
                tileColor: Colors.red,
                selectedTileColor: Colors.yellow,
                selected: true,
                activeColor: Colors.pink,
                contentPadding: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onChanged: (String? val) {
                  setState(() {
                    _radioTile = val ?? '';
                  });
                },
              ),
              Row(
                children: [
                  const Checkbox(value: false, onChanged: null),
                  const Checkbox(value: true, onChanged: null),
                  Checkbox(
                      activeColor: Colors.orange.withOpacity(0.5),
                      checkColor: Colors.green,
                      value: _selectVal,
                      side: const BorderSide(color: Colors.pink, width: 2.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      onChanged: (bool? val) {
                        setState(() {
                          _selectVal = val;
                        });
                      }),
                ],
              ),
              CheckboxListTile(
                  value: _selectVal,
                  title: const Text("CheckboxListTile"),
                  subtitle: const Text("subtitle"),
                  secondary: const Icon(Icons.add),
                  onChanged: (bool? val) {
                    setState(() {
                      _selectVal = val;
                    });
                  }),
              Slider(
                  value: _val,
                  min: 0.0,
                  max: 50.0,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue.withOpacity(0.5),
                  thumbColor: Colors.orange,
                  divisions: 5,
                  label: "个数",
                  onChanged: (double d) {
                    setState(() {
                      _val = d;
                    });
                  }),
              SliderTheme(
                data: const SliderThemeData(
                    activeTrackColor: Colors.green,
                    trackHeight: 12.0,
                    trackShape: RectangularSliderTrackShape(),
                    inactiveTrackColor: Colors.blueGrey,
                    thumbColor: Colors.orange,
                    inactiveTickMarkColor: Colors.pink,
                    tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 5.0)
                    // valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    // valueIndicatorShape: RectangularSliderValueIndicatorShape(),
                    // thumbShape: RoundSliderThumbShape(
                    //     enabledThumbRadius: 20.0,
                    //     elevation: 50.0,
                    //     pressedElevation: 50.0)
                    ),
                child: Slider(
                    value: _val,
                    min: 0.0,
                    max: 50.0,
                    divisions: 5,
                    label: "个数",
                    onChanged: (double d) {
                      setState(() {
                        _val = d;
                      });
                    }),
              ),
              Switch(
                  value: _switch,
                  onChanged: (val) {
                    setState(() {
                      _switch = val;
                    });
                  }),
              const SizedBox(
                width: 200.0,
                child: LinearProgressIndicator(),
              ),
              const LinearProgressIndicator(
                value: 0.5,
                valueColor: AlwaysStoppedAnimation(Colors.red),
                backgroundColor: Colors.yellow,
                minHeight: 15.0,
              ),
              const CircularProgressIndicator(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100.0,
                    height: 50.0,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 100.0,
                    height: 60.0,
                    color: Colors.blue,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  Container(
                    width: 100.0,
                    height: 20.0,
                    color: Colors.blue,
                  )
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 150.0,
                    height: 150.0,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.orange,
                  ),
                  const Positioned(
                    child: Text("中央"),
                    left: 60.0,
                  )
                ],
              ),
              Container(
                width: 400.0,
                height: 300.0,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.orange)),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 10.0,
                  runAlignment: WrapAlignment.end,
                  alignment: WrapAlignment.spaceEvenly,
                  children: List.generate(10, (index) {
                    double w = 30.0 + 10.0 * index;
                    double h = 30.0 + 5.0 * index;
                    return Container(
                      width: w,
                      height: h,
                      color: Colors.primaries[index],
                    );
                  }),
                ),
              ),
              Container(
                width: 400.0,
                height: 400.0,
                padding: const EdgeInsets.all(10.0),
                color: Colors.black26,
                margin: const EdgeInsets.all(10.0),
                child: Flow(
                  delegate: SimpFlow(),
                  children: List.generate(9, (index) {
                    return Container(
                      width: 200.0,
                      height: 30.0,
                      // padding: const EdgeInsets.all(10.0),
                      child: Text("$index"),
                      decoration: BoxDecoration(
                          color: Colors.primaries[index],
                          border: const Border(
                              bottom: BorderSide(color: Colors.white))),
                    );
                  }),
                ),
              )
            ],
          ),
        ));
  }
}

class SimpFlow extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; i++) {
      context.paintChild(i,
          transform: Matrix4.translationValues(i * 10, i * 40, 0), opacity: 1);
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
