  $(document).ready(function () {
    // 수량 변경 시 Ajax 호출
    $('.qty-input').on('change', function () {
      const $row = $(this).closest('tr');
      const cno = $row.data('cno'); // tr에 cno가 있어야 함!
      const newQty = $(this).val();

      $.ajax({
        url: '${pageContext.request.contextPath}/cart/updateQuantity.do',
        method: 'POST',
        data: {
          cno: cno,
          quantity: newQty
        },
        success: function (response) {
          if (response === 'success') {
            location.reload(); // 새로고침해서 총액 반영
          } else {
            alert('수량 변경 실패');
          }
        },
        error: function () {
          alert('에러 발생!');
        }
      });
    });
  });