use poseidon::poseidon::bn254::hash_4;

fn main(
    secret: Field,
    amount_low: Field,
    lot_id_low: Field,
    winner: Field,
) -> pub Field {
    hash_4([secret, amount_low, lot_id_low, winner])
}