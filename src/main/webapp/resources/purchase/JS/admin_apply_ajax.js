/**
 * 
 */
var kinds = ["","한식","중식","일식","양식","퓨전","기타"];
var tastes = ["","밥/죽/떡","면/만두","국물","구이/찜/조림","볶음/튀김/부침","나물/샐러드","베이킹/디저트","양념","음료"];
var _csrf = $("input:hidden[name=_csrf]").val();
var c_target = "";

$(".modal-toggle").click(function(){
   var target = $(event.target);
   c_target = target.parents("tr");
   
   appltDetail(target);
});

$(".apply").click(function() {
   var target = $(event.target);
   console.log(c_target);
   if(confirm("승인 처리를 하시겠습니까?")){
      apply(target);
   }
});

$(".search-btn").click(function(){
   var target = $(event.target);
   
   applySearch(target);
});

$(".recipe-search").keydown(function() {
   var target = $(event.target).parent().children(".search-btn");
   
   if(event.keyCode == 13){
      applySearch(target);
      target.removeClass("black");
   }
});

$(".nav-content li").click(function(){
   var target = $(event.target);
   var check = $(event.target).attr("data-check");
   
   $(".nav-content li").attr("class", "");
   target.addClass("black");
   
   $.ajax({
      url: "./applyByCheck?a_check=" + check,
      type: "GET",
      cache: false,
      success: function(data, status){
         if(status == "success"){
            setTable(data);
         }
      }
   });
});

function setTable(jsonObj){
   var data = jsonObj.data;
   var str = "";
   
   if(data.length == 0){
      alert("데이터가 없습니다.");
   } else if(data.length > 0) {
      for (var i = 0; i < data.length; i++) {
         str += '<tr data-aid="'+data[i].applyno+'">';
         str += '<th scope="row" data-toggle="modal" data-target="#staticBackdrop" class="modal-toggle"><div class="name">'+data[i].a_name+'</div></th>';
         str += '<td class="price">'+data[i].a_price+'</td>';
         str += '<td class="seller">'+data[i].u_name+'</td>';
         str += '<td class="regdate">'+data[i].regdate+'</td>';
         if(data[i].a_check == 0){
            str += '<td class="check">승인대기</td>';
         }else if(data[i].a_check == 1){
            str += '<td class="check">승인완료</td>';
         }else if(data[i].a_check == 2){
            str += '<td class="check">승인취소</td>';
         }
         str += '</tr>';
      }
   }
   
   $("#tbody").html(str);
}

function apply(target) {
   var a_check = target.attr("data-apply");
   var applyno = target.parents(".modal-content").attr("data-applyno");
   
   $.ajax({
      url: "./applyAccept?applyno=" + applyno + "&a_check=" + a_check + "&_csrf=" + _csrf,
      type: "PUT",
      cache: false,
      success: function(data, status){
         if(status == "success"){
            if(data.status == "OK"){
               if(a_check == 1){
                  c_target.children(".check").text("승인 완료");
               } else if(a_check == 2){
                  c_target.children(".check").text("승인 취소");
               }
               setTimeout(function(){
                  alert("처리가 완료 되었습니다.");
               }, 300);
            }else {
               alert("다시 시도해 주세요.");
            }
         }else {
            alert("다시 시도해 주세요.");
         }
      }
   });
   
}

function appltDetail(target){
   var applyno = target.parents("tr").attr("data-aid");

   $.ajax({
      url: "./applyDetail?applyno=" + applyno,
      type: "GET",
      cache: false,
      success: function(data, status){
         if(status == "success"){
            setApply(data);
         }
      }
   });
}

function setApply(jsonObj){
   var data = jsonObj.data[0];
   
   $(".modal-content").attr("data-applyno", data.applyno)
   $(".apply-prod-name").text(data.a_name);
   $(".apply-img img").attr("src", getContextPath() + "/upload/recipe/"+data.a_img);
   $(".apply-prod-price").text(data.a_price);
   $(".apply-prod-content").text(data.a_content);
   $(".apply-prod-kind").text(kinds[parseInt(data.a_kind)]);
   $(".apply-prod-taste").text(tastes[parseInt(data.a_taste)]);
   $(".apply-prod-count").text(data.a_count);
   $(".apply").attr("class", "btn btn-dark apply");
   
   if(data.a_check != 0){
      $(".apply").addClass("hidden");
   }
}

function applySearch(target){
   var search = $(event.target).parent().children(".recipe-search").val();
   
   $(".nav-content li").attr("class", "");
   target.addClass("black");
   
   $.ajax({
      url: "./applySearch?search=" + search,
      type: "GET",
      cache: false,
      success: function(data, status){
         if(status == "success"){
            setTable(data);
         }
      }
   });
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
