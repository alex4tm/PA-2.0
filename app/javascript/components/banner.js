import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const typedOne = document.querySelector('#typed-text1');
  // const typedTwo = document.querySelector('#typed-text2');

  if (typedOne) {
    new Typed('#typed-text1', {
      strings: ["YouKnowMe"],
      typeSpeed: 45,
      showCursor: false,
      fadeOut: true,
      fadeOutDelay: 1500,
      backDelay: 1000,
      backSpeed: 30,
      loop: true
    });
  }

  // if (typedTwo) {
  //   new Typed('#typed-text2', {
  //     strings: ["Stop wasting your time - send your preferences and information the right way."],
  //     typeSpeed: 65,
  //     showCursor: false,
  //     fadeOut: true,
  //     fadeOutDelay: 4000,
  //     loop: true,
  //     backDelay: 2000,
  //     startDelay: 6000,
  //     backSpeed: 40,
  //   });
  // }
}

export { loadDynamicBannerText };
