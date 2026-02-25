const { poseidonHashMany } = require('micro-starknet');

function splitU256(value) {
    const mask = (1n << 128n) - 1n;
    const low = value & mask;
    const high = value >> 128n;
    return { low, high };
}

function computeCommitment(amount, nonce, bidder, lot_id) {
    // Convert to BigInt
    const amountBig = BigInt(amount);
    const nonceBig = BigInt(nonce);
    const bidderBig = BigInt(bidder);
    const lotIdBig = BigInt(lot_id);
    
    // Split amount and lot_id into low parts (matching circuit)
    const { low: amountLow } = splitU256(amountBig);
    const { low: lotIdLow } = splitU256(lotIdBig);
    
    // Order MUST match circuit: [amount, nonce, bidder, lot_id]
    const hash = poseidonHashMany([
        amountLow,
        nonceBig,
        bidderBig,
        lotIdBig
    ]);
    
    return hash.toString();
}

// Test data (matching your Prover.toml)
const bids = [
    { amount: 100, nonce: 123, bidder: '0x1111', lot_id: 1 },
    { amount: 150, nonce: 456, bidder: '0x2222', lot_id: 1 },
    { amount: 120, nonce: 789, bidder: '0x3333', lot_id: 1 }
];

console.log('=== Commitment Hashes for Prover.toml ===');
console.log('(Order: [amount, nonce, bidder, lot_id])\n');

bids.forEach((bid, index) => {
    const hash = computeCommitment(bid.amount, bid.nonce, bid.bidder, bid.lot_id);
    console.log(`Bid ${index + 1} (amount=${bid.amount}):`);
    console.log(`"${hash}"`);
    console.log();
});

console.log('Copy these values into your Prover.toml');
