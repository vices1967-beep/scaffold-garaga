const { poseidonHashMany } = require('micro-starknet');

function splitU256(value) {
    const mask = (1n << 128n) - 1n;
    const low = value & mask;
    const high = value >> 128n;
    return { low, high };
}

function computeCommitment(amount, nonce, bidder, lot_id) {
    const amountLow = splitU256(BigInt(amount)).low;
    const lotIdLow = splitU256(BigInt(lot_id)).low;
    
    // Order MUST match circuit: [amount, nonce, bidder, lot_id]
    return poseidonHashMany([
        amountLow,
        BigInt(nonce),
        BigInt(bidder),
        BigInt(lot_id)
    ]).toString();
}

// Test data
const bids = [
    { amount: 100, nonce: 123, bidder: 4369, lot_id: 1 },
    { amount: 150, nonce: 456, bidder: 8738, lot_id: 1 },
    { amount: 120, nonce: 789, bidder: 13107, lot_id: 1 }
];

console.log('=== Commitment Hashes ===');
bids.forEach((bid, i) => {
    const hash = computeCommitment(bid.amount, bid.nonce, bid.bidder, bid.lot_id);
    console.log(`Bid ${i+1} (amount=${bid.amount}): ${hash}`);
});