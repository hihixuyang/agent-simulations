
public abstract class Domain {

    public abstract void visualize();

    public abstract void startSim(int iterations);

    public abstract void nextTurn();

    public abstract void initializeAgents(Agent[] agents);
}
