const DELAY = 40;
const COLOR_SPEED = 256;
const SPEED = 512;
const DEFAULT_COLOR = {r: 0, g: 0, b: 0};

function setPixel({image, x, y, r, g, b }) {
  let rPos = image.width * y * 4 + x * 4;
  image.data[rPos] = r;
  image.data[rPos + 1] = g;
  image.data[rPos + 2] = b;
  image.data[rPos + 3] = 255;
};

function getPixel({image, x, y}) {
  let rPos = image.width * y * 4 + x * 4;
  return {r: image.data[rPos], g: image.data[rPos + 1], b: image.data[rPos + 2]};
};

function blendPixel(data) {
  const old = getPixel(data);
  const r = Math.round(data.r * data.a / 255 + old.r * (255 - data.a) / 255);
  const g = Math.round(data.g * data.a / 255 + old.g * (255 - data.a) / 255);
  const b = Math.round(data.b * data.a / 255 + old.b * (255 - data.a) / 255);
  setPixel({...data, r, g, b});
};

function incept() {
  const body = document.getElementsByTagName('body')[0];
  body.style.backgroundColor = 'black';
  body.style.maxWidth = '100%';
  body.style.padding = '0';
  body.style.margin = '0';
  const canvas = document.createElement('canvas');
  const width = window.screen.width;
  canvas.setAttribute('width', width);
  const height = window.screen.height;
  canvas.setAttribute('height', height);
  body.appendChild(canvas);

  const ctx = canvas.getContext('2d');
  const image = ctx.createImageData(width, height);

  for (let x = 0; x < width; x++) {
    for (let y = 0; y < height; y++) {
      setPixel({...DEFAULT_COLOR, image, x, y});
    }
  }
  ctx.putImageData(image, 0, 0);

  const data = { ctx, image, width, height,
    x: width / 2,
    y: height / 2,
    r: 0,
    g: 0,
    b: 0,
    a: 32
  }

  update(data);
}

function randomWalk(n, max, wrap = false) {
  n = Math.floor(Math.random() * 3) - 1 + n;
  if (n < 0) {
    if (wrap) return max;
    else return 0;
  } else if (n > max) {
    if (wrap) return 0;
    else return max;
  } else {
    return n;
  }
}

function update(data) {
  for (let i = 0; i < COLOR_SPEED; i++) {
    data.r = randomWalk(data.r, 255);
    data.g = randomWalk(data.g, 255);
    data.b = randomWalk(data.b, 255);
  }

  for (let i = 0; i < SPEED; i++) {
    data.x = randomWalk(data.x, data.width - 1);
    data.y = randomWalk(data.y, data.height - 1);
    blendPixel(data);
  }

  data.ctx.putImageData(data.image, 0, 0);

  setTimeout(() => update(data), DELAY);
}

incept();
