
public abstract class Domain {

    /**
     * This is a method that every domain class should implement, which
     * allows the programmer to visualize the current state of the domain,
     * including any and all relevant information like positions, etc.
     */
    public abstract void visualize();

    /**
     * Used by the Simulator class (which is the main class) to start the simulation.
     * @param iterations The number of iterations for which the simulation should execute
     */
    public abstract void startSim(int iterations);

    /**
     * This will be called mostly from within the domain class, but let's require that
     * every subclass of Domain implement it in order to standardize the implementation if possible.
     */
    public abstract void nextTurn();

    /**
     * This will be called by the Simulator, which passes in an array of agents which will all be
     * the ones participating in the simulation. Domain can then call getAction() and update these
     * agents directly from this array.
     * @param agents An array of all the agents that will participate in the simulation.
     */
    public abstract void initializeAgents(Agent[] agents);

    /**
     * Called at the very end of the Simulator, once the simulation has finished executing. This will return
     * an integer value, possibly out of 1000, that describes the 'success rate' of the simulation for an easy
     * visualization / later analysis.
     * @return the success rate of the simulation, in some standardized form
     */
    public abstract int getSuccessRate();
}
