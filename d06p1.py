from operator import add
from sys import stdin


def fish(fs):
    """
    Transform a list of fish represented by their time-to-spawn state into a list of the
    number of fish in each state indexed by their time-to-spawn.

    Under this strategy, the example input [3, 4, 3, 1, 2] would be transformed into
    [0, 1, 1, 2, 1, 0, 0, 0, 0].
    """
    fis = [0] * 9
    for f in fs:
        fis[f] += 1
    return fis


def population(generation, fis):
    """
    Get the accumulated fish population at the given generation.

    This is accomplished by rotating the number of fish in each state left (à la a
    bitwise rotate, with the leftmost number representing the fish in the process of
    spawning coming back around to the 7-steps-to-next-spawn index) and then adding in
    the newly spawned fish (in this case, via zipping the result together with a
    additive mask).

    Achieves space = O(1) and time = O(generation) by operating over aggregated number
    of fish in each state rather than managing each fish's individual state.

    This implementation attempts to transliterate the functional solution, rather
    than translate the aforementioned steps into an imperative "Pythonic" solution.
    """
    for _ in range(generation):
        fis = list(map(add, [0, 0, 0, 0, 0, 0, fis[0], 0, 0], fis[1:] + [fis[0]]))
    return sum(fis)


def population2(generation, fis):
    """
    A imperative Pythonic translation of the functional solution using mutable state,
    which probably is more efficient in Python's execution environment.
    """
    for _ in range(generation):
        spawn = fis.pop(0)
        fis.append(spawn)
        fis[6] += spawn
    return sum(fis)


if __name__ == "__main__":
    print(population(80, fish(map(int, stdin.read().split(",")))))
