//Weight

$(function () {
   Highcharts.setOptions({
        colors: ['#3382FF']});
    $('#weight').highcharts({
        chart: {
            type: 'bar',
            height: 80,
            backgroundColor: null
        },
        title: {
            enabled: false,
            text : ''
           },
           
        exporting: { 
             enabled: false 
        },
        
        xAxis: {
            categories: ['Kg'],
            title: {
                text: null
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
               enabled: false,
                text : ''
            },
            labels: {
                overflow: 'justify',
                style: {
                    color: '#D5D5D5'
                }
            }
        },
        tooltip: {
            valueSuffix: ' Kg'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: false
                }
            }
        },
        legend: {
            enabled: false
        },
        credits: {
            enabled: false
        },
        series: [{
            name: ' ',
            data: [currWeight]
        }]
    });
});