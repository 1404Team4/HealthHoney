// LINE AND BARS CHARTS
/*$(function () {
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'World\'s largest cities per 2014'
        },
        subtitle: {
            text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
        },
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Population (millions)'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
        },
        series: [{
            name: 'Population',
            data: [
                ['Shanghai', 23.7],
                ['Lagos', 16.1],
                ['Instanbul', 14.2],
                ['Karachi', 14.0],
                ['Mumbai', 12.5],
                ['Moscow', 12.1],
                ['São Paulo', 11.8],
                ['Beijing', 11.7],
                ['Guangzhou', 11.1],
                ['Delhi', 11.1],
                ['Shenzhen', 10.5],
                ['Seoul', 10.4],
                ['Jakarta', 10.0],
                ['Kinshasa', 9.3],
                ['Tianjin', 9.3],
                ['Tokyo', 9.0],
                ['Cairo', 8.9],
                ['Dhaka', 8.9],
                ['Mexico City', 8.9],
                ['Lima', 8.9]
            ],
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                x: 4,
                y: 10,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif',
                    textShadow: '0 0 3px black'
                }
            }
        }]
    });
});*/

$(function () {
  function generateNumber(min, max) {
    min = typeof min !== 'undefined' ? min : 1;
    max = typeof max !== 'undefined' ? max : 100;
    
    return Math.floor((Math.random() * max) + min);
  }
  
  var chart,
      categories = ['Categorie 1', 'Categorie 2', 'Categorie 3', 'Categorie 4', 'Categorie 5','Categorie 6', 'Categorie 7', 'Categorie 8', 'Categorie 9', 'Categorie 10', 'Categorie 11', 'Categorie 12', 'Categorie 13', 'Categorie 14', 'Categorie 15', 'Categorie 16', 'Categorie 17', 'Categorie 18', 'Categorie 19','Categorie 20', 'Categorie 21','Categorie 22', 'Categorie 23', 'Categorie 24', 'Categorie 25', 'Categorie 26', 'Categorie 27', 'Categorie 28', 'Categorie 29', 'Categorie 30'],
      serie1 = [estiStepsArr[0], estiStepsArr[1], estiStepsArr[2], estiStepsArr[3], estiStepsArr[4],estiStepsArr[5], estiStepsArr[6], 
                estiStepsArr[7], estiStepsArr[8], estiStepsArr[9], estiStepsArr[10], estiStepsArr[11], estiStepsArr[12], estiStepsArr[13], estiStepsArr[14], 11, 14, 11, 11, 11, 11, 13, 22, 10, 18, 15, 24, 31, 19, 10],
      serie2 = [walkingMinList],
      $aapls;
  
  $(document).ready(function() {

    chart = new Highcharts.Chart({
      chart: {
        renderTo: 'importantchart',
        type: 'column',
        backgroundColor: 'transparent',
        height: 140,
        marginLeft: 3,
        marginRight: 3,
        marginBottom: 0,
        marginTop: 0
      },
      title: {
        text: ''
      },
      xAxis: {
        lineWidth: 0,
        tickWidth: 0,
        labels: { 
          enabled: false 
        },
        categories: categories
      },
      yAxis: {
        labels: { 
          enabled: false 
        },
        gridLineWidth: 0,
        title: {
          text: null,
        },
      },
      series: [{
        name: 'Awesomness',
        data: serie1
      }, {
        name: 'More Awesomness',
        color: '#fff',
        type: 'line',
        data: serie2
      }],
      credits: { 
        enabled: false 
      },
      legend: { 
        enabled: false 
      },
      plotOptions: {
        column: {
          borderWidth: 0,
          color: '#b2c831',
          shadow: false
        },
        line: {
          marker: { 
            enabled: false 
          },
          lineWidth: 5
        }
      },
      tooltip: { 
        enabled: false
      }
    });
      
    setInterval(function() {
      chart.series[0].addPoint(generateNumber(), true, true);
      chart.series[1].addPoint(generateNumber(50, 150), true, true);
    }, 1000);
    
    
  
    setInterval(function() {
      $('.info-aapl span').each(function(index, elem) {
        $(elem).animate({
          height: generateNumber(1, 40)
        });
      });

    }, 3000);
  });
  
});

