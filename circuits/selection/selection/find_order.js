const { poseidonHashMany } = require('micro-starknet');

function splitU256(value) {
    const mask = (1n << 128n) - 1n;
    const low = value & mask;
    const high = value >> 128n;
    return { low, high };
}

function computeHash(order, amount, nonce, bidder, lot_id) {
    const amountLow = splitU256(BigInt(amount)).low;
    const lotIdLow = splitU256(BigInt(lot_id)).low;
    const nonceBig = BigInt(nonce);
    const bidderBig = BigInt(bidder);
    
    const inputs = [
        order[0] === 'amount' ? amountLow : 
        order[0] === 'nonce' ? nonceBig :
        order[0] === 'bidder' ? bidderBig : lotIdLow,
        order[1] === 'amount' ? amountLow :
        order[1] === 'nonce' ? nonceBig :
        order[1] === 'bidder' ? bidderBig : lotIdLow,
        order[2] === 'amount' ? amountLow :
        order[2] === 'nonce' ? nonceBig :
        order[2] === 'bidder' ? bidderBig : lotIdLow,
        order[3] === 'amount' ? amountLow :
        order[3] === 'nonce' ? nonceBig :
        order[3] === 'bidder' ? bidderBig : lotIdLow
    ];
    
    return poseidonHashMany(inputs).toString();
}

const circuitHash = "2188824287183927522224640574525727508869631115729782366268903789464524522843 - 1664652891821549591626308301419474072277642299240406278872355169345877096728";
const circuitHashPos = (2188824287183927522224640574525727508869631115729782366268903789464524522843n - 1664652891821549591626308301419474072277642299240406278872355169345877096728n).toString();

console.log("Hash from circuit (positive):", circuitHashPos);
console.log();

const orders = [
    ['amount', 'nonce', 'bidder', 'lot_id'],
    ['amount', 'nonce', 'lot_id', 'bidder'],
    ['amount', 'bidder', 'nonce', 'lot_id'],
    ['amount', 'bidder', 'lot_id', 'nonce'],
    ['amount', 'lot_id', 'nonce', 'bidder'],
    ['amount', 'lot_id', 'bidder', 'nonce'],
    ['nonce', 'amount', 'bidder', 'lot_id'],
    ['nonce', 'amount', 'lot_id', 'bidder'],
    ['nonce', 'bidder', 'amount', 'lot_id'],
    ['nonce', 'bidder', 'lot_id', 'amount'],
    ['nonce', 'lot_id', 'amount', 'bidder'],
    ['nonce', 'lot_id', 'bidder', 'amount'],
    ['bidder', 'amount', 'nonce', 'lot_id'],
    ['bidder', 'amount', 'lot_id', 'nonce'],
    ['bidder', 'nonce', 'amount', 'lot_id'],
    ['bidder', 'nonce', 'lot_id', 'amount'],
    ['bidder', 'lot_id', 'amount', 'nonce'],
    ['bidder', 'lot_id', 'nonce', 'amount'],
    ['lot_id', 'amount', 'nonce', 'bidder'],
    ['lot_id', 'amount', 'bidder', 'nonce'],
    ['lot_id', 'nonce', 'amount', 'bidder'],
    ['lot_id', 'nonce', 'bidder', 'amount'],
    ['lot_id', 'bidder', 'amount', 'nonce'],
    ['lot_id', 'bidder', 'nonce', 'amount']
];

orders.forEach(order => {
    const hash = computeHash(order, 100, 123, '0x1111', 1);
    console.log(`${order.join(', ')}: ${hash}`);
    if (hash === circuitHashPos) {
        console.log('>>> ORDEN ENCONTRADO <<<');
    }
});