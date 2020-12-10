var _csrf = $("input:hidden[name=_csrf]").val();

$("document").ready(function() {
	$.ajax({
    	url : "./recipeState/?&_csrf=" + _csrf,
    	type : 'POST',
    	cache : false,
    	success : function(data, status) {
    		if(status=="success") {
    			if(data.status == "OK") {
    				
    				parseJSON(data)
    				
    			}
    		}
    		
    	}

    });
	
	$.ajax({
    	url : "./userRecipeState/?&_csrf=" + _csrf,
    	type : 'POST',
    	cache : false,
    	success : function(data, status) {
    		if(status=="success") {
    			if(data.status == "OK") {
    				
    				parseJSON2(data)
    				
    			}
    		}
    		
    	}

    });
	
	$.ajax({
    	url : "./purchaseState/?&_csrf=" + _csrf,
    	type : 'POST',
    	cache : false,
    	success : function(data, status) {
    		if(status=="success") {
    			if(data.status == "OK") {
    				
    				parseJSON3(data)
    				
    			}
    		}
    		
    	}

    });
	
});

function parseJSON(jsonObj){
	
	var data = jsonObj.data;
	//pie
	var ctxP = document.getElementById("pieChart").getContext('2d');
	var myPieChart = new Chart(ctxP, {
	  type: 'pie',
	  data: {
	    labels: ["한식", "중식", "일식", "양식", "퓨전", "기타"],
	    datasets: [{
	      data: [data[0], data[1], data[2], data[3], data[4], data[5]],
	      backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360", "#86E57F"],
	      hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774", "#9FF592"]
	    }]
	  },
	  options: {
	    responsive: true,
	    legend: false
	  }
	});	
}

function parseJSON2(jsonObj){

	var data = jsonObj.data;
	//pie
	var ctxP = document.getElementById("pieChart2").getContext('2d');
	var myPieChart = new Chart(ctxP, {
	  type: 'pie',
	  data: {
	    labels: ["한식", "중식", "일식", "양식", "퓨전", "기타"],
	    datasets: [{
	      data: [data[0], data[1], data[2], data[3], data[4], data[5]],
	      backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360", "#86E57F"],
	      hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774", "#9FF592"]
	    }]
	  },
	  options: {
	    responsive: true,
	    legend: false
	  }
	});	
	
}

function parseJSON3(jsonObj){

	var data = jsonObj.data;
	
	console.log(data);
	
	// Line
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        datasets: [{
          label: '# 년간 판매량',
          data: [data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11]],
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 94, 0, 0.2)',
            'rgba(255, 228, 0, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(255, 187, 0, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(0, 216, 255, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(0, 84, 255, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 0, 221, 0.2)',
            'rgba(255, 0, 127, 0.2)'
            
          ],
          borderColor: [
			'rgba(255, 99, 132, 1)',
			'rgba(255, 94, 0, 1)',
			'rgba(255, 228, 0, 1)',
			'rgba(255, 206, 86, 1)',
			'rgba(255, 187, 0, 1)',
			'rgba(75, 192, 192, 1)',
			'rgba(0, 216, 255, 1)',
			'rgba(54, 162, 235, 1)',
			'rgba(0, 84, 255, 1)',
			'rgba(153, 102, 255, 1)',
			'rgba(255, 0, 221, 1)',
			'rgba(255, 0, 127, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    });
	
}




    