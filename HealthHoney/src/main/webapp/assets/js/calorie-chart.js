//Calorie Consumption

$(function () {
   Highcharts.setOptions({
        colors: ['#FF9000', '#C1175A', '#4BC5AB', '#132128']});
    $('#calorie').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            backgroundColor: null,
            height: 200,
            margin: [0, 0, 0, 0],
            spacing: [0, 0, 0, 0],
            
        },
        
        credits: {
            enabled: false
          },
        title: {
            text: ' ',
            align: 'center',
            verticalAlign: 'middle',
            y: 50
        },
        
        exporting: { 
            enabled: false 
         },
         
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
               size: 260,
                dataLabels: {
                   color:'black',
                    enabled: true,
                    distance: -30
                },
                startAngle: -90,
                endAngle: 90,
                center: ['50%', '75%']
            }
        },
        series: [{
           pointPadding: 0,
            groupPadding: 0,
            type: 'pie',
            name: ' ',
            innerSize: '50%',
            data: [
               ['걷기 소비',   0],
               ['달리기 소비',    0],
               ['자전거 소비', 0],
               
            ]
        }]
    });
});