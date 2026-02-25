use poseidon::poseidon::bn254::hash_4;

global MAX_BIDS: u32 = 8;

struct Bid {
    amount: u64,
    nonce: Field,
    bidder: Field,
    lot_id: Field
}

fn main(
    bids: [Bid; MAX_BIDS],
    valid_bids: [bool; MAX_BIDS],
    lot_id: Field
) -> pub [Field; MAX_BIDS] {
    let mut computed_hashes = [0; MAX_BIDS];
    
    for i in 0..MAX_BIDS {
        if valid_bids[i] {
            computed_hashes[i] = hash_4([
                bids[i].amount as Field,
                bids[i].nonce,
                bids[i].bidder,
                lot_id
            ]);
        }
    }
    computed_hashes
}