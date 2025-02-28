(define (domain building-scheduler)
    (:requirements :strips :typing)
    (:types 
        inhabitant room time worker - object)
    
    (:predicates
        (room-available ?r - room)
        (room-locked ?r - room)
        (inhabitant-arrived ?i - inhabitant ?t - time)
        (inhabitant-settled ?i - inhabitant ?r - room)
        (worker-at ?w - worker ?r - room)
    )
    
    (:action join
        :parameters (?w - worker ?from - room ?to - room)
        :precondition (worker-at ?w ?from)
        :effect (and
            (not (worker-at ?w ?from))
            (worker-at ?w ?to)
        )
    )

    (:action unlock
        :parameters (?w - worker ?r - room)
        :precondition (and
            (worker-at ?w ?r)
            (room-locked ?r)
        )
        :effect (not (room-locked ?r))
    )

    (:action showRoom
        :parameters (?w - worker ?i - inhabitant ?r - room ?t - time)
        :precondition (and
            (inhabitant-arrived ?i ?t)
            (room-available ?r)
            (worker-at ?w ?r)
            (not (room-locked ?r))
        )
        :effect (and
            (inhabitant-settled ?i ?r)
            (not (room-available ?r))
        )
    )
)
