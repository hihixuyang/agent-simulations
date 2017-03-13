
public class Simulator {

    private Domain dom;
    private int iterations;

    private Simulator(Domain d, int iter) {
        dom = d;
        iterations = iter;
    }

    /**
     * Responsible for initializing the agents that will be used in the simulation.
     * This should be called through the Simulator() constructor so the user can customize
     * this as desired from the main() method.
     * @return an array of Agents, each possibly a separate subclass, describing the agents
     */
    private Agent[] initializeAgents() {
        return null;
    }

    /**
     * Performs the main function of the simulator - passes the domain the agents and
     * begins the simulation. It also retrieves the completion rate at the very end.
     */
    private int execute() {
        Agent[] agents = initializeAgents();
        dom.initializeAgents(agents);
        dom.startSim(iterations);

        return dom.getSuccessRate();
    }

    /**
     * The main method. Simply creates a new simulator and lets execute() do the work.
     */
    public static void main(String[] args) {

        Domain d = new TestDomain();

        Simulator prog = new Simulator(d, 1000);
        int result = prog.execute();

        System.out.println(result);
    }
}
