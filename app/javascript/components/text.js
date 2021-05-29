// Wrap every letter in a span
const text = () => {

  const textWrapper = document.querySelector('.ml6 .letters');

  if (textWrapper) {
    textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

    anime.timeline({loop: true})
      .add({
        targets: '.ml6 .letter',
        translateY: ["1.1em", 0],
        translateZ: 0,
        duration: 1500,
        delay: (el, i) => 50 * i
      }).add({
        targets: '.ml6',
        opacity: 0,
        duration: 2000,
        easing: "easeOutExpo",
        delay: 3000
      });
  }
}

export { text };
