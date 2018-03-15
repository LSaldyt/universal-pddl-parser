
#include "Instance.h"

namespace parser { namespace pddl {

    void FunctionExpression::PDDLPrint( std::ostream & s, const TokenStruct< std::string > & ts, const Domain & d ) const {
    	ParamCond * c = d.funcs[d.funcs.index( fun->name )];

    	s << "( " << fun->name;
    	IntVec v( c->params.size() );
    	for ( unsigned i = 0; i < v.size(); ++i ) {
    		if ( ts.size() && fun->params[i] >= 0 ) s << " " << ts[fun->params[i]];
    		else s << " " << d.types[c->params[i]]->object( fun->params[i] ).first;
    	}
    	s << " )";
    }

    double FunctionExpression::evaluate( Instance & ins, const StringVec & par ) {
    	ParamCond * c = ins.d.funcs[ins.d.funcs.index( fun->name )];

    	IntVec v( c->params.size() );
    	for ( unsigned i = 0; i < v.size(); ++i ) {
    		std::pair< bool, unsigned > p = ins.d.types[c->params[i]]->parseObject( par[fun->params[i]] );
    		if ( p.first ) v[i] = p.second;
    		else {
    			std::pair< bool, int > q = ins.d.types[c->params[i]]->parseConstant( par[fun->params[i]] );
    			if ( q.first ) v[i] = q.second;
    			else return 1;
    		}
    	}

    	for ( unsigned i = 0; i < ins.init.size(); ++i )
    		if ( ins.init[i]->name == c->name && ins.init[i]->params == v )
    			return ((GroundFunc<double> *)ins.init[i])->value;
    	return 1;
    }
} }
