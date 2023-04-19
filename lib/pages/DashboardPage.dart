import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meritwithfirebase/model/SalesData.dart';


final data = [
  SalesData('2017', 100),
  SalesData('2018', 75),
  SalesData('2019', 150),
  SalesData('2020', 200),
  SalesData('2021', 175),
  SalesData('2017', 100),
  SalesData('2018', 75),
  SalesData('2019', 150),
  SalesData('2020', 200),
  SalesData('2021', 1000),
];

final series = [
  charts.Series(
    id: 'Sales',
    data: data,
    domainFn: (SalesData sales, _) => sales.year,
    measureFn: (SalesData sales, _) => sales.sales,
    colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  ),
];

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: charts.BarChart(
          series,
          animate: true,
          domainAxis: const charts.OrdinalAxisSpec(
            renderSpec: charts.SmallTickRendererSpec(
              labelRotation: 60,
              labelAnchor: charts.TickLabelAnchor.centered,
            ),
          ),
          behaviors: [
            charts.SeriesLegend(),
            charts.ChartTitle('Sales by Year'),
          ],
          vertical: false,
          barRendererDecorator: charts.BarLabelDecorator<String>(),

        ),
      ),
    );
  }
}
