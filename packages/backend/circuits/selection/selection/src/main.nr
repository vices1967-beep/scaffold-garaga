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
) -> pub [Field; 2] {
    // Find maximum bid among valid ones
    let mut max_amount: u64 = 0;
    let mut max_bidder: Field = 0;
    for i in 0..MAX_BIDS {
        if valid_bids[i] {
            if bids[i].amount > max_amount {
                max_amount = bids[i].amount;
                max_bidder = bids[i].bidder;
            }
        }
    }

    // Return winner address and amount as public outputs
    [max_bidder, max_amount as Field]
}