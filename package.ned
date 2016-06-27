package hello.simulations;

import inet.networklayer.configurator.ipv4.IPv4NodeConfigurator;
import inet.networklayer.configurator.generic.GenericNetworkConfigurator;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.ethernet.Eth10M;
import inet.node.ethernet.Eth1G;
import inet.node.ethernet.Eth100M;
import inet.networklayer.configurator.ipv4.FlatNetworkConfigurator;
import inet.node.inet.MulticastRouter;
import inet.node.inet.StandardHost;


@license(LGPL);
//
// TODO documentation
//
network Network
{
    @display("bgb=565,333");
    submodules:
        source: StandardHost {
            @display("p=61,119");
        }
        Host5: StandardHost {
            @display("p=215,305");
        }
        Host1: StandardHost {
            @display("p=388,43");
        }
        Host2: StandardHost {
            @display("p=490,78");
        }
        Host3: StandardHost {
            @display("p=522,166");
        }
        Host4: StandardHost {
            @display("p=471,248");
        }
        Host6: StandardHost {
            @display("p=176,226");
        }
        R1: MulticastRouter {
            @display("p=234,102");
        }
        R3: MulticastRouter {
            @display("p=283,201");
        }
        R2: MulticastRouter {
            @display("p=379,141");
        }
        Configurator: IPv4NetworkConfigurator {
            @display("p=172,46");
        }
    connections:
        R2.ethg++ <--> Eth10M <--> Host4.ethg++;
        R2.ethg++ <--> Eth10M <--> Host3.ethg++;
        Host5.ethg++ <--> Eth10M <--> R3.ethg++;
        Host6.ethg++ <--> Eth10M <--> R3.ethg++;
        Host2.ethg++ <--> Eth10M <--> R2.ethg++;
        R1.ethg++ <--> Eth10M <--> Host1.ethg++;
        source.ethg++ <--> Eth1G <--> R1.ethg++;
        R2.ethg++ <--> Eth1G <--> R3.ethg++;
        R1.ethg++ <--> Eth1G <--> R3.ethg++;
        R1.ethg++ <--> Eth1G <--> R2.ethg++;
}

