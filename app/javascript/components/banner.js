import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#typed-text1', {
    strings: ["Welcome to Personal Assistant 2.0 - You name it, We save it !"],
    typeSpeed: 65,
    showCursor: false,
    fadeOut: true,
    fadeOutDelay: 8000,
    backDelay: 2000,
    backSpeed: 40,
    loop: true
  });
  new Typed('#typed-text2', {
    strings: ["Stop wasting your time - send your preferences and  information the right way."],
    typeSpeed: 65,
    showCursor: false,
    fadeOut: true,
    fadeOutDelay: 4000,
    loop: true,
    backDelay: 2000,
    startDelay: 6000,
    backSpeed: 40,
  });
}

export { loadDynamicBannerText };
