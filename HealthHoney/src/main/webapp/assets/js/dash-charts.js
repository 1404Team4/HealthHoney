/*** First Chart in Dashboard page ***/

   //LINE AND BARS CHARTS
$(function    () {
   Highcharts.setOptions({
        colors: ['#FF9000','#132128']});
  // Build the chart
   $('#dashChart1').highcharts({
      chart: {
         plotBackgroundColor: null,
         plotBorderWidth: null,
         plotShadow: false,
         backgroundColor: null,
         height: 230,
         margin: [0,0,0,0],
         
      },
      
      title: {
         enabled: true,
         text : ''
        },
        
        exporting: { 
           enabled: false 
        },
      
      tooltip: {
         pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
      },
      plotOptions: {
         pie: {
           size: 200,
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
               color:'black',
               enabled: true,
               distance: -30
            },
            showInLegend: false
         }
      },
      
      credits: {
          enabled: false
        },
     
      series: [{
         type: 'pie',
         name: 'Percentage',
         data: [
                ['걸음 수',   estiStepsPercent],
                ['목표 걸음 수까지',   100-estiStepsPercent]
                ],
         
      }]
   });
});


/*** second Chart in Dashboard page ***/

$(function () {
   Highcharts.setOptions({
        colors: ['#FF9000', '#C1175A', '#4BC5AB', '#132128']});
      // Build the chart
      $('#dashChart2').highcharts({
         chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            backgroundColor: null,
            height: 230,
            margin: [0,0,0,0],
            
         },
         
         title: {
            enabled: false,
            text : ''
           },
           
           exporting: { 
              enabled: false 
           },
         
         tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
         },
         plotOptions: {
            pie: {
              size: 200,
               allowPointSelect: true,
               cursor: 'pointer',
               dataLabels: {
                  color:'black',
                  enabled: true,
                   distance: -30
               },
               showInLegend: false
            }
         },
         
         credits: {
             enabled: false
           },
           
         series: [{
            type: 'pie',
            name: 'Percentage',
            data: [
                   ['걸은 시간',   walkingMinPer],
                   ['뛴 시간',     runningMinPer],
                   ['라이딩 시간',  bikingMinPer],
                   ['목표량까지 남은 시간',   100-(walkingMinPer+runningMinPer+bikingMinPer)]
                   ]
            
         }]
      });
   });