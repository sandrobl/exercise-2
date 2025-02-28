(define (problem building-scheduler-problem)
    (:domain building-scheduler)
    
    (:objects
        worker1 - worker
        inhabitant1 inhabitant2 - inhabitant
        room1 room2 lobby - room
        time9 time10 - time
    )
    
    (:init
        (worker-at worker1 lobby)
        
        (room-available room1)
        (room-available room2)
        (room-locked room1)
        (room-locked room2)

        (inhabitant-arrived inhabitant1 time9)
        (inhabitant-arrived inhabitant2 time10)
    )
    
    (:goal
        (and
            (inhabitant-settled inhabitant1 room1)
            (inhabitant-settled inhabitant2 room2)
        )
    )
)
