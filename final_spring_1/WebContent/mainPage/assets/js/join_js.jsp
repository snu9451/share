<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function () {
    //인증번호 값을 담을 변수 선언
    let safetyCode;

    //[[인증번호받기]] 클릭시 이벤트.
    $("#btn_getCode").click(function () {
      //핸드폰번호 입력값
      let inputCellPhone = $("#inputCellPhone").val();
      console.log(inputCellPhone.length);

      //핸드폰 번호가 입력되지 않은 경우
      if (inputCellPhone.length < 0 || inputCellPhone.length == 0) {
        swal("핸드폰 번호를 입력해주세요!", "", "info");
        return;
      }

      //핸드폰 번호가 입력된경우
      else {
        let dt = "mem_phone=" + inputCellPhone;
        console.log(inputCellPhone);
        $.ajax({
          type: "post",
          data: dt,
          url: "http://192.168.0.206:7000/member/sendSMSCode.nds",
          success: function (data) {
            console.log(data);
            safetyCode = data;
          },
        });
      }
    });

    //인증번호 [[확인]] 버튼 클릭시
    $("#btn__codeChck").on("click", function () {
      const safetyCodeChck__box = $("#safetyCodeChck__box");

      let inputSafetyCode = $("#inputSafetyCode").val();
      console.log(inputSafetyCode);
      console.log(safetyCode);
      console.log(inputSafetyCode.length);

      if (inputSafetyCode.length > 0) {
        if (inputSafetyCode === safetyCode) {
          safetyCodeChck__box.empty();
          safetyCodeChck__box.html(`<small id="safetyCodeChck"
						class="form-text"
						style="color:green; font-weight:bold ;
						font-size: 15px; "
	          value="1">
						인증번호가 일치합니다 : )
						</small>
						`);
        } else {
          safetyCodeChck__box.empty();
          safetyCodeChck__box.html(`<small id="safetyCodeChck"
						class="form-text"
						style="color:red; font-weight:bold ;
						font-size: 15px; "
	          value="0">
						인증번호가 틀립니다!!!
						</small>
						`);
        }
      } else {
        swal("인증번호를 입력해주세요!!", "", "warning");
      }
    });

    //비밀번호 8자리 이하로 입력후 나갈시
    $("#inputPassWord").focusout(function () {
      if ($(this).val().length < 8) {
        console.log($(this).val().length);
        swal("비밀번호는 8자리 이상 입력해주세요.", "경고!!", "warning");
      } else {
        return;
      }
    });

    $("#checkPassWord").focusout(function () {
      if ($(this).val().length < 8) {
        console.log($(this).val().length);
        swal("비밀번호를 다시 입력해주세요.", "경고!!", "warning");
      } else {
        return;
      }
    });

    //비밀번호 일치 여부 결과 표시할 div박스
    const pwChck_box = $("#pwChck__box");

    //비밀번호 확인 이벤트
    $("#checkPassWord").on("keyup change", function () {
      let input = $("#inputPassWord");
      let chck = $("#checkPassWord");
      let inputVal = $("#inputPassWord").val();
      let chckVal = $("#checkPassWord").val();
      console.log("change");
      console.log("1차입력: " + inputVal);
      console.log("2차입력: " + chckVal);

      if ($(this).val().length >= 8) {
        if ($(this).val() === inputVal) {
          pwChck_box.empty();
          pwChck_box.html(`<small id="pwChck"
						class="form-text"
						style="color:green; font-weight:bold ;
						font-size: 15px;"
	          value="1">
						비밀번호가 일치합니다 : )
						</small>
						`);
        } else {
          pwChck_box.empty();
          pwChck_box.html(`<small id="pwChck"
						class="form-text"
						style="color:red; font-weight:bold;
						font-size: 15px; "
	          value="0">
						비밀번호가 다릅니다 : (
						</small>
						`);
        }
      } else {
        console.log("low");
      }
    });

    //닉네임 중복 확인 이벤트
    $("#btn_nickChck").click(function () {
      //닉네임 입력값
      let inputNickName = $("#inputNickName").val();

      if (inputNickName.length <= 1) {
        console.log(inputNickName.length);
        swal(
          "닉네임은 2글자 이상 입력해주세요.",
          "plz type more than 2 words",
          "warning"
        );
      } else {
        console.log(inputNickName.length);
        console.log("2글자");
        $.ajax({
          type: "post",
          data: "mem_nickname=" + inputNickName,
          url: "/member/selectNickName.nds",
          success: function (data) {
            $("#nickChck__box").html(data);
          },
          error: function (e) {
            console.log("error: " + e.responseText);
          },
        });
      }
    });

    //연령대 선택여부 결과 표시할 div박스
    const ageChck__box = $("#ageChck__box");

    //연령대 선택 이벤트
    $("#inputAge").on("focusout change", function () {
      let select_chck = $("#inputAge").val();
      console.log(select_chck);

      //연령대 선택 여부
      if (select_chck <= 0) {
        ageChck__box.empty();
        ageChck__box.html(`<small id="ageChck"
		class="form-text"
		style="color:red; font-weight:bold ;
		font-size: 15px; "
		value="0">
		연령대를 선택해주세요.
		</small>
		`);
      } else {
        ageChck__box.empty();
        ageChck__box.html(`<small id="ageChck"
		class="form-text"
		style="color:green; font-weight:bold ;
		font-size: 15px;"
		value="1">
		선택되었습니다.
		</small>
		`);
      }
    });

    //e-mail value 임의 지정
    $("#inputEmail").val("webtree12@gmail.com");

    //회원가입 [[ 확인 ]] 버튼 이벤트
    $("#btn_signUp").on("click", function (e) {
      e.preventDefault();
      let formData;

      // 다른 input 태그들 입력 여부
      console.log($("#signUpForm input"));
      console.log("length: " + $("#signUpForm input").val().length);

      //연령대 체크 여부
      let select_chck = $("#inputAge[name='mem_age']").val();
      console.log("select: " + select_chck);

      //성별 체크 여부
      let radio_chck = $("input:radio[name='mem_gender']").is(":checked");
      console.log("radio: " + radio_chck);

      let sum = 0;

      $("#signUpForm input").each(function (index, obj) {
        let input_chck = $(obj).val().length;
        if ($(this).attr("type") == "radio") return true;
        console.log("input_chck " + $(this) + ", " + input_chck);
        //각각의 input에 값이 들어있는지 체크
        if (input_chck <= 0) {
          //하나라도 입력이 안됐을시 함수 탈출
          return false;
        } else {
          //input에 값이 입력될때 마다 sum에 카운트 up
          sum++;
        }
      });
      //input에 모든 값이 입력되고 연령대와 성별이 모두 체크됐을 때
      if (sum == 6 && select_chck != 0 && radio_chck) {
        //form의 input data를 한꺼번에 넘겨준다
        formData = $("#signUpForm").serialize();
        console.log(formData);
        swal("모든정보확인.", "", "success").then(() => {
          console.log("알람창 확인");
          $.ajax({
            type: "post",
            data: formData,
            url: "/member/insertMember.nds",
            success: function (data) {
              cnosole.log(data);
              $("#signUpForm").submit();
            },
            error: function (data) {
              console.log();
            },
          });
        });
      } else {
        swal("정보들을 모두 입력해주세요.", "", "warning");
      }
    });

    //회원가입 모달창이 사라졌을 때 이벤트
    $("#signUpModal").on("hidden.bs.modal", function () {
      console.log("modal hidden");
      //input 값 리셋
      $("#signUpForm")[0].reset();

      //인증번호, 비밀번호, 닉네임 등 확인여부 문장들 리셋
      $(".doEmpty").each(function () {
        $(this).empty();
      });
    });
  }); /*================================ END document ready ============================*/
</script>
