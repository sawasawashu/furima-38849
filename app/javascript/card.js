const pay = () => {
  const payjp = Payjp('pk_test_25ba193d18561a044400061f')// PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);