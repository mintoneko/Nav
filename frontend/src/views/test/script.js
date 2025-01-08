
// 确保SVG元素可见
gsap.set("svg", { visibility: "visible" });

// 动画效果设置
gsap.to("#headStripe", {
  y: 0.5,
  rotation: 1,
  yoyo: true,
  repeat: -1,
  ease: "sine.inOut",
  duration: 1
});

gsap.to("#spaceman", {
  y: 0.5,
  rotation: 1,
  yoyo: true,
  repeat: -1,
  ease: "sine.inOut",
  duration: 1
});

gsap.to("#craterSmall", {
  x: -3,
  yoyo: true,
  repeat: -1,
  duration: 1,
  ease: "sine.inOut"
});

gsap.to("#craterBig", {
  x: 3,
  yoyo: true,
  repeat: -1,
  duration: 1,
  ease: "sine.inOut"
});

gsap.to("#planet", {
  rotation: -2,
  yoyo: true,
  repeat: -1,
  duration: 1,
  ease: "sine.inOut",
  transformOrigin: "50% 50%"
});

gsap.to("#starsBig g", {
  rotation: () => `random(-30,30)`,
  transformOrigin: "50% 50%",
  yoyo: true,
  repeat: -1,
  ease: "sine.inOut"
});

gsap.fromTo(
  "#starsSmall g",
  { scale: 0, transformOrigin: "50% 50%" },
  {
    scale: 1,
    transformOrigin: "50% 50%",
    yoyo: true,
    repeat: -1,
    stagger: 0.1
  }
);

gsap.to("#circlesSmall circle", {
  y: -4,
  yoyo: true,
  duration: 1,
  ease: "sine.inOut",
  repeat: -1
});

gsap.to("#circlesBig circle", {
  y: -2,
  yoyo: true,
  duration: 1,
  ease: "sine.inOut",
  repeat: -1
});

// 玻璃闪光效果
gsap.set("#glassShine", { x: -68 });

gsap.to("#glassShine", {
  x: 80,
  duration: 2,
  rotation: -30,
  ease: "expo.inOut",
  transformOrigin: "50% 50%",
  repeat: -1,
  repeatDelay: 8,
  delay: 2
});

// 汉堡菜单切换
const burger = document.querySelector('.burger');
const nav = document.querySelector('nav');

if (burger && nav) { // 确保元素存在
  burger.addEventListener('click', () => {
    const isClosed = burger.dataset.state === 'closed';
    burger.dataset.state = isClosed ? "open" : "closed";
    nav.dataset.state = isClosed ? "open" : "closed";
  });
}