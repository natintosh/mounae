import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/global/page_route/slide_up_dialog_transition_route.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:sized_context/sized_context.dart';

class GlobalExitAppView extends StatefulWidget {
  const GlobalExitAppView({Key? key}) : super(key: key);

  @override
  _GlobalExitAppViewState createState() => _GlobalExitAppViewState();

  static void show(BuildContext context) {
    Navigator.of(context).push(
      SlideUpDialogTransitionRoute(
        child: GlobalExitAppView(),
      ),
    );
  }
}

class _GlobalExitAppViewState extends State<GlobalExitAppView> {
  @override
  Widget build(BuildContext context) {
    return _GlobalExitAppWidgetView(this);
  }

  void close() {
    Navigator.of(context).pop();
  }

  void onCancelButtonPressed() {
    close();
  }

  void onQuitButtonPressed() {
    //TODO (1): Graceful shutdown app.
  }
}

class _GlobalExitAppWidgetView
    extends WidgetView<GlobalExitAppView, _GlobalExitAppViewState> {
  _GlobalExitAppWidgetView(_GlobalExitAppViewState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          GestureDetector(
            onTap: state.close,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: context.widthPct(0.65),
              alignment: Alignment.center,
              child: Card(
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0.sp),
                ),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.sp, horizontal: 16.sp),
                        child: Text(
                          'Quite Session?',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: state.onCancelButtonPressed,
                              child: Text('Cancel'),
                            ),
                          ),
                          SizedBox(
                            height: 48.sp,
                            child: VerticalDivider(
                              width: 1.sp,
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: state.onQuitButtonPressed,
                              child: Text('Quit'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
