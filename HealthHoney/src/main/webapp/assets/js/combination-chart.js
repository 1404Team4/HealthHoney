//Combination Chart

$(function () {
   Highcharts.setOptions({
        colors: ['#FF9000', '#C1175A', '#4BC5AB', '#DFDFDF']});
    $('#combination').highcharts({
       chart: {
          height: 378,
          backgroundColor: null
          
      },
        title: {
           enabled: false,
            text: ''
        },
        
        legend: {
            itemStyle: {
                color: '#D5D5D5'
            }
        },
        
        tooltip: {
        	valueSuffix: ' min'
        },
        
        xAxis: {
            categories: [(combDate.getMonth()+1)+'/'+(combDate.getDate()-9),
                         (combDate.getMonth()+1)+'/'+(combDate.getDate()-8),
                         (combDate.getMonth()+1)+'/'+(combDate.getDate()-7),
                         (combDate.getMonth()+1)+'/'+(combDate.getDate()-6),
                         (combDate.getMonth()+1)+'/'+(combDate.getDate()-5),
                         (combDate.getMonth()+1)+'/'+(combDate.getDate()-4),
                         (combDate.getMonth()+1)+'/'+(combDate.getDate()-3),
                         (combDate.getMonth()+1)+'/'+(combDate.getDate()-2),
                         (combDate.getMonth()+1)+'/'+(combDate.getDate()-1),
                         (combDate.getMonth()+1)+'/'+(combDate.getDate())],
            title: {
                text: 'Date (Month / Day)',
                style: {
                    color: '#D5D5D5'
                }
            },
            labels: {
                style: {
                    color: '#D5D5D5'
                }
            }
        },
        
        yAxis: {
            min: 0,
            title: {
                text: 'Activity Time (min)',
                style: {
                    color: '#D5D5D5'
                }
            },
            labels: {
                style: {
                    color: '#D5D5D5'
                }
            }
        },
        
        labels: {
            items: [{
                html: ' ',
                style: {
                    left: '80px',
                    top: '3px',
                    color:  (Highcharts.theme && Highcharts.theme.textColor) || 'white'
                }
            }]
        },
        
        credits: {
            enabled: false
          },
          
        series: [{
            type: 'column',
            name: 'Walking',
            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }, {
            type: 'column',
            name: 'Running',
            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }, {
            type: 'column',
            name: 'Biking',
            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }, {
            type: 'spline',
            name: 'Daily Total',
            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            marker: {
                lineWidth: 2,
                lineColor: Highcharts.getOptions().colors[3],
                fillColor: 'white'
            }
        }]
    });
});