import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oria_pro/client/moduls/tracker/feature/enitity/severity_log.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../utils/constants/oria_colors.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({
    required this.severityLogs,
    required this.otherSeverityLogs,
  });

  final List<SeverityLog> severityLogs;
  final List<SeverityLog> otherSeverityLogs;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      margin: EdgeInsets.zero,
      backgroundColor: Colors.white,
      legend: const Legend(isVisible: false),
      primaryXAxis: const CategoryAxis(
        isVisible: true,
        interval: 1,
        labelPlacement: LabelPlacement.onTicks,
        labelStyle: TextStyle(
          fontFamily: "Satoshi",
          color: Colors.grey,
        ),
      ),
      primaryYAxis: NumericAxis(
        isVisible: true,
        minimum: 1,
        maximum: 5,
        interval: 1,
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        majorTickLines: const MajorTickLines(size: 0),
        axisLabelFormatter: (axisLabelRenderArgs) {
          TextStyle style = const TextStyle(
            fontFamily: "Raleway",
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFFABABAB),
          );
          switch (axisLabelRenderArgs.value) {
            case 5:
              return ChartAxisLabel(AppLocalizations.of(context)!.great, style);
            case 4:
              return ChartAxisLabel(AppLocalizations.of(context)!.good, style);
            case 3:
              return ChartAxisLabel(AppLocalizations.of(context)!.okay, style);
            case 2:
              return ChartAxisLabel(AppLocalizations.of(context)!.bad, style);
            case 1:
              return ChartAxisLabel(AppLocalizations.of(context)!.awful, style);
            default:
              return ChartAxisLabel('', style);
          }
        },
      ),
      series: <SplineAreaSeries<SeverityLog, String>>[
        SplineAreaSeries<SeverityLog, String>(
          dataSource: severityLogs,
          xValueMapper: (SeverityLog logs, _) =>
              DateFormat("dd/MM").format(logs.day),
          yValueMapper: (SeverityLog logs, _) => logs.severity,
          color: Colors.red.withOpacity(0.5),
          borderColor: Colors.red,
          borderWidth: 2,
          gradient: const LinearGradient(
            colors: <Color>[Colors.white, Colors.red],
            stops: [0.0, 1.0],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          dataLabelSettings: const DataLabelSettings(isVisible: false),
        ),
        SplineAreaSeries<SeverityLog, String>(
          dataSource: otherSeverityLogs,
          xValueMapper: (SeverityLog logs, _) =>
              DateFormat("dd/MM").format(logs.day),
          yValueMapper: (SeverityLog logs, _) => logs.severity,
          color: OriaColors.chartSecondaryColor.withOpacity(0.5),
          borderColor: OriaColors.chartSecondaryColor,
          borderWidth: 2,
          gradient: const LinearGradient(
            colors: <Color>[Colors.white, OriaColors.chartSecondaryColor],
            stops: [0.0, 1.0],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          dataLabelSettings: const DataLabelSettings(isVisible: false),
        ),
      ],
    );
  }
}

class SeverityChart extends StatefulWidget {
  const SeverityChart({
    super.key,
    required this.severityLogs,
    required this.otherSeverityLogs,
  });
  final List<SeverityLog> severityLogs;
  final List<SeverityLog> otherSeverityLogs;

  @override
  State<StatefulWidget> createState() => SeverityChartState();
}

class SeverityChartState extends State<SeverityChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 6),
                  child: _LineChart(
                    severityLogs: widget.severityLogs,
                    otherSeverityLogs: widget.otherSeverityLogs,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
