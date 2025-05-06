import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/stuffs/constants/constants.dart';
import 'package:flutter_boilerplate/stuffs/ui_presentation/widgets/custom_button.dart';

class ShowDialog {
  static Future<bool?> showDialogSetting(
      {required BuildContext context,
      required String title,
      required String content,
      required VoidCallback onTapYes,
      required String yesButtonText}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
          ),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отменить'),
            ),
            TextButton(
              onPressed: onTapYes,
              child: Text(yesButtonText),
            ),
          ],
        );
      },
    );
  }

  static void showDialogOnScreen({
    required BuildContext context,
    required String title,
    required VoidCallback onTapYes,
    required VoidCallback onTapNo,
  }) {
    showDialog(
      context: context,
      builder: (ctxt) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: MColor.greenPrimary,
              fontSize: 20,
            ),
            // textAlign: TextAlign.,
          ),
          titlePadding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          actions: [
            SizedBox(
              width: 100,
              child: CustomButton(title: 'Нет', onTap: onTapNo),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              child: CustomButton(title: 'Да', onTap: onTapYes),
            ),
          ],
        );
      },
    );
  }

  static void showDialogPaymentSchedule({
    required BuildContext context,
  }) {
    showDialog(
      useSafeArea: true,
      context: context,
      builder: (ctxt) {
        return AlertDialog(
          backgroundColor: MColor.white,
          surfaceTintColor: MColor.white,
          actionsOverflowDirection: VerticalDirection.down,
          titlePadding: EdgeInsets.zero,
          title: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            decoration: BoxDecoration(
              color: MColor.greenPrimary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Text(
              'Iphone 15',
              textAlign: TextAlign.center,
              style: MTextStyle.ui_16MediumHeight28(MColor.white),
            ),
          ),
          actionsPadding: EdgeInsets.symmetric(
            vertical: 26,
            horizontal: 18,
          ),
          actions: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: MColor.textInactive),
                        ),
                        child: Image(
                          height: 33,
                          width: 33,
                          alignment: Alignment.center,
                          color: MColor.greenPrimary,
                          image: AssetImage(
                              'assets/images/payment_schedule/lucide_info.png'),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Уважаемый покупатель! Не забывайте вовремя оплачивать сумму за текущий месяц',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: MTextStyle.ui_12Medium(MColor.textGray),
                        ),
                      )
                    ],
                  ),
                  _buildListTile(
                    title: 'Месяц',
                    info: 'Август',
                  ),
                  _buildDivider(),
                  _buildListTile(title: 'Срок', info: '01.01.2024'),
                  _buildDivider(),
                  _buildListTile(title: 'Общая сумма', info: '50 000'),
                  _buildDivider(),
                  _buildListTile(title: 'Оплачено', info: '40 000'),
                  _buildDivider(),
                  _buildListTile(title: 'Долг', info: '10 000'),
                  _buildDivider(),
                  const SizedBox(height: 26),
                  CustomButton(
                    title: 'Назад',
                    onTap: () => Navigator.pop(context),
                    colofOfContainer: Colors.white,
                    hasShadow: false,
                    textColor: MColor.greenPrimary,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget _buildDivider() {
    return Row(
      children: List.generate(
        51,
        (index) => Expanded(
          child: Container(
            color: index % 2 == 0 ? MColor.dividerColor : Colors.transparent,
            height: 1,
          ),
        ),
      ),
    );
  }

  static Widget _buildListTile({required String title, required String info}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        title,
        style: MTextStyle.ui_16MediumHeight28(MColor.textGray),
      ),
      trailing: Text(
        info,
        style: MTextStyle.ui_16Semi(MColor.greenPrimary),
      ),
    );
  }
}
