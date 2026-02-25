const { poseidonHashMany } = require('micro-starknet');

function splitU256(value) {
  const mask = (1n << 128n) - 1n;
  const low = value & mask;
  const high = value >> 128n;
  return { low, high };
}

const secret = 614053n;
const amount = 15000n;
const lot_id = 4n;
const winner = 0x4f348398f859a55a0c80b1446c5fdc37edb3a8478a32f10764659fc241027d3n;

const { low: amountLow } = splitU256(amount);
const { low: lotIdLow } = splitU256(lot_id);

const commitment = poseidonHashMany([secret, amountLow, lotIdLow, winner]);
console.log('Commitment calculado:', commitment.toString());
