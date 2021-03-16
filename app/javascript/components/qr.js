const flipQr = () => {
  const wrapper = document.querySelector('#info-wrapper');

  if (wrapper) {
    wrapper.addEventListener('click', (event) => {
      // code here
      // 1. Toggle hidden class on qr code span
      const qrCode = document.querySelector('.qr-wrapper');
      qrCode.classList.toggle('show-animation');
      // 2. Toggle lexie class on hex section


      // select the arrow with JS and add css to flip
      const qrArrow = document.querySelector('#qr-arrow');
      console.log(qrArrow);
      qrArrow.classList.toggle('flip-up');



    });
  }
}

export { flipQr };
