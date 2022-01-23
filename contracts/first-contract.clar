;; Make a counter variable, which can be incremented by the contract-deployer, but can be viewed by anybody.


(define-constant contract-deployer tx-sender)


(define-data-var counter uint u0)

(define-read-only (get-count) 
    (begin 
        (var-get counter)
    )
)

(define-public (count-up)
;;    (ok (var-set counter (+ (get-count) u1 )))
    (begin 
        (asserts! (is-eq contract-deployer tx-sender ) (err u101))
        (var-set counter (+ (var-get counter) u1  )  )
        (ok true)
    )
)
;; ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.first-contract
;; STNHKEPYEPJ8ET55ZZ0M5A34J0R3N5FM2CMMMAZ6
;; ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM (deployer)
;; wallet 1 ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5