import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/tabpay_core/common/widgets/appbar_container.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

@RoutePage()
class NumpadPage extends StatefulWidget {
  final Function(int number) onTap;
  final Function(int number) onTap2;
  final String topButtonTitle;
  final String bottomButtonTitle;
  final String pageTitle;
  const NumpadPage(
      {Key? key,
      required this.onTap,
      required this.onTap2,
      required this.topButtonTitle,
      required this.bottomButtonTitle,
      required this.pageTitle})
      : super(key: key);

  @override
  _NumpadPageState createState() => _NumpadPageState();
}

class _NumpadPageState extends State<NumpadPage> {
  final TextEditingController tranAmountController = TextEditingController();
  late bool isNumButtonEnable = false;
  late int amount = 0;
  Future<void> onChangeAmountValue(String value) async {
    setState(() {
      isNumButtonEnable = (value.isEmpty || value == '0') ? false : true;

      if (value.length > 7) {
        tranAmountController.text =
            value.replaceAll(",", '').substring(0, 7).toComma();
      } else {
        if (value.isNotEmpty) tranAmountController.text = value.toComma();
      }
    });
  }

  Future<void> setAmount({required int amount}) async {
    setState(() {
      amount = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppbarContainer(
      title: widget.pageTitle,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Мөнгөн дүн",
                      style:
                          TextStyle(color: Colors.grey, fontSize: getSize(13)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalSize(78),
                    ),
                    child: InputNumpad(
                      hintText: '0',
                      onChangeValue: (value) => onChangeAmountValue(value),
                      controller: tranAmountController,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: getHorizontalSize(78)),
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                      color: Colors.grey,
                    ))),
                  ),
                  SizedBox(height: getSize(20)),
                  KeyboardNumpad(
                    buttonSize: 64,
                    buttonColor: Colors.white,
                    iconColor: Colors.blueGrey,
                    controller: tranAmountController,
                    delete: () {
                      String val = tranAmountController.text;
                      tranAmountController.text = val.isNotEmpty
                          ? val.substring(0, val.length - 1).replaceAll(",", '')
                          : '0';

                      onChangeAmountValue(tranAmountController.text);
                    },
                    deleteAll: () {
                      tranAmountController.text = '0';
                      onChangeAmountValue(tranAmountController.text);
                    },
                    onSubmit: () {
                      // debugPrint('submit');
                    },
                    onTap: () {
                      onChangeAmountValue(tranAmountController.text);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: getSize(20)),
            Padding(
              padding: EdgeInsets.only(bottom: size.height < 812 ? 10 : 45),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: getHorizontalSize(88)),
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: defaultButton(
                          isEnabled: isNumButtonEnable,
                          fillColor: HexColor("#04715E"),
                          buttonBorderColor: HexColor("#04715E"),
                          buttonTextColor: Colors.white,
                          buttonLabel: widget.topButtonTitle,
                          onTap: () {
                            widget.onTap(int.parse(
                                tranAmountController.text.replaceAll(",", '')));
                          }),
                    ),
                    SizedBox(height: getSize(8)),
                    SizedBox(
                      width: 200,
                      child: defaultButton(
                        buttonLabel: widget.bottomButtonTitle,
                        buttonBorderColor: HexColor("#04715E"),
                        onTap: () {
                          widget.onTap2(int.parse(
                              tranAmountController.text.replaceAll(",", '')));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputNumpad extends StatelessWidget {
  const InputNumpad(
      {Key? key,
      required this.hintText,
      required this.onChangeValue,
      required this.controller})
      : super(key: key);

  final String hintText;
  final Function onChangeValue;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setStates) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              child: TextField(
            enabled: false,
            decoration: InputDecoration.collapsed(
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.black)),
            controller: controller,
            showCursor: false,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              // fontFamily: FontFamily.codeNextSemiBold
            ),
            textAlign: TextAlign.center,
          )),
          textLabel(
              value: '₮',
              fontSize: 32,
              color: Colors.grey,
              align: TextAlign.right),
        ],
      ),
    );
  }
}

class KeyboardNumpad extends StatelessWidget {
  const KeyboardNumpad(
      {Key? key,
      this.buttonSize = 64,
      this.buttonColor = Colors.white,
      this.iconColor = Colors.amber,
      required this.delete,
      required this.deleteAll,
      required this.onSubmit,
      required this.controller,
      this.zeroStart = false,
      this.onTap})
      : super(key: key);

  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function deleteAll;
  final Function onSubmit;
  final Function? onTap;
  final bool zeroStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getHorizontalSize(56)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: getSize(35)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NumpadItemWidget(
                  key: const Key("numpad_1"),
                  number: '1',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                ),
                NumpadItemWidget(
                  key: const Key("numpad_2"),
                  number: '2',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                ),
                NumpadItemWidget(
                  key: const Key("numpad_3"),
                  number: '3',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                )
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NumpadItemWidget(
                  key: const Key("numpad_4"),
                  number: '4',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                ),
                NumpadItemWidget(
                  key: const Key("numpad_5"),
                  number: '5',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                ),
                NumpadItemWidget(
                  key: const Key("numpad_6"),
                  number: '6',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                )
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NumpadItemWidget(
                  key: const Key("numpad_7"),
                  number: '7',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                ),
                NumpadItemWidget(
                  key: const Key("numpad_8"),
                  number: '8',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                ),
                NumpadItemWidget(
                  key: const Key("numpad_9"),
                  number: '9',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                )
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NumpadItemWidget(
                  key: const Key("numpad_00"),
                  number: '00',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                ),
                NumpadItemWidget(
                  key: const Key("numpad_0"),
                  number: '0',
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                  onTap: onTap,
                  zeroStart: zeroStart,
                ),
                Padding(
                  padding: EdgeInsets.all(getSize(5)),
                  child: InkWell(
                    onLongPress: () => deleteAll(),
                    onTap: () => delete(),
                    child: SvgPicture.asset(
                      Assets.images.numpad.numXButton.path,
                      fit: BoxFit.fill,
                      color: Colors.black,
                      width: buttonSize,
                      height: buttonSize,
                    ),
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}

class NumpadItemWidget extends StatelessWidget {
  const NumpadItemWidget(
      {Key? key,
      required this.number,
      required this.size,
      required this.color,
      required this.controller,
      this.zeroStart = false,
      this.onTap})
      : super(key: key);

  final String number;
  final double size;
  final Color color;
  final TextEditingController controller;
  final Function? onTap;
  final bool zeroStart;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getSize(5)),
      alignment: Alignment.center,
      height: getSize(
        size,
      ),
      width: getSize(
        size,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          if (zeroStart) {
            controller.text += number;
          } else {
            if (controller.text.startsWith('0')) {
              controller.text = (number == '00') ? '0' : number;
            } else {
              controller.text += number;
            }
          }

          if (onTap != null) {
            onTap!();
          }

          controller.text.replaceAll(",", "");
        },
        child: Center(
          child: textLabel(
              value: number,
              fontSize: 24,
              align: TextAlign.center,
              color: Colors.black),
        ),
      ),
    );
  }
}
