// Generated by Bisonc++ V4.09.02 on Wed, 27 Apr 2016 22:51:30 +0530

#ifndef ParserBase_h_included
#define ParserBase_h_included

#include <exception>
#include <vector>
#include <iostream>

// $insert preincludes
#include "ast.h"
#include <memory>
// $insert debugincludes
#include <iostream>
#include <sstream>
#include <string>
#include <unordered_map>
#include <iomanip>

namespace // anonymous
{
    struct PI__;
}


// $insert polymorphic
enum class Tag__
{
    SymTabEntryClass,
    vSymTabEntry,
    RefAstClass,
    vExpAstClass,
    BaseClass,
    StmtAstClass,
    ExpAstClass,
    String,
};

namespace Meta__
{
    template <Tag__ tag>
    struct TypeOf;

    template <typename Tp_>
    struct TagOf;

// $insert polymorphicSpecializations
    template <>
    struct TagOf<SymTabEntry>
    {
        static Tag__ const tag = Tag__::SymTabEntryClass;
    };

    template <>
    struct TagOf<vector<SymTabEntry>>
    {
        static Tag__ const tag = Tag__::vSymTabEntry;
    };

    template <>
    struct TagOf<RefAst*>
    {
        static Tag__ const tag = Tag__::RefAstClass;
    };

    template <>
    struct TagOf<vector<ExpAst*>>
    {
        static Tag__ const tag = Tag__::vExpAstClass;
    };

    template <>
    struct TagOf<abstract_astnode *>
    {
        static Tag__ const tag = Tag__::BaseClass;
    };

    template <>
    struct TagOf<StmtAst*>
    {
        static Tag__ const tag = Tag__::StmtAstClass;
    };

    template <>
    struct TagOf<ExpAst*>
    {
        static Tag__ const tag = Tag__::ExpAstClass;
    };

    template <>
    struct TagOf<std::string>
    {
        static Tag__ const tag = Tag__::String;
    };

    template <>
    struct TypeOf<Tag__::SymTabEntryClass>
    {
        typedef SymTabEntry type;
    };

    template <>
    struct TypeOf<Tag__::vSymTabEntry>
    {
        typedef vector<SymTabEntry> type;
    };

    template <>
    struct TypeOf<Tag__::RefAstClass>
    {
        typedef RefAst* type;
    };

    template <>
    struct TypeOf<Tag__::vExpAstClass>
    {
        typedef vector<ExpAst*> type;
    };

    template <>
    struct TypeOf<Tag__::BaseClass>
    {
        typedef abstract_astnode * type;
    };

    template <>
    struct TypeOf<Tag__::StmtAstClass>
    {
        typedef StmtAst* type;
    };

    template <>
    struct TypeOf<Tag__::ExpAstClass>
    {
        typedef ExpAst* type;
    };

    template <>
    struct TypeOf<Tag__::String>
    {
        typedef std::string type;
    };


        // The Base class: 
        // Individual semantic value classes are derived from this class.
        // This class offers a member returning the value's Tag__
        // and two member templates get() offering const/non-const access to
        // the actual semantic value type.
    class Base
    {
        Tag__ d_tag;
    
        protected:
            Base(Tag__ tag);

        public:
            Base(Base const &other) = delete;

            Tag__ tag() const;
    
            template <Tag__ tg_>
            typename TypeOf<tg_>::type &get();
    };
    
        // The class Semantic is derived from Base. It stores a particular
        // semantic value type. 
    template <Tag__ tg_>
    class Semantic: public Base
    {
        typedef typename TypeOf<tg_>::type DataType;
    
        DataType d_data;
    
        public:
                // The default constructor and constructors for 
                // defined data types are available
            Semantic();
            Semantic(DataType const &data);
            Semantic(DataType &&tmp);

            DataType &data();
    };

        // The class Stype wraps the shared_ptr holding a pointer to Base.
        // It becomes the polymorphic STYPE__
        // It also wraps Base's get members, allowing constructions like
        // $$.get<INT> to be used, rather than $$->get<INT>.
        // Its operator= can be used to assign a Semantic *
        // directly to the SType object. The free functions (in the parser's
        // namespace (if defined)) semantic__ can be used to obtain a 
        // Semantic *. 
    struct SType: public std::shared_ptr<Base>
    {
        template <typename Tp_>
        SType &operator=(Tp_ &&value);

        Tag__ tag() const;

            // this get()-member checks for 0-pointer and correct tag 
            // in shared_ptr<Base>, and resets the shared_ptr's Base * 
            // to point to Meta::__Semantic<tg_>() if not
        template <Tag__ tg_>
        typename TypeOf<tg_>::type &get();

            // the data()-member does not check, and may result in a 
            // segfault if used incorrectly
        template <Tag__ tg_>
        typename TypeOf<tg_>::type &data();
    };

}  // namespace Meta__

class ParserBase
{
    public:
// $insert tokens

    // Symbolic tokens:
    enum Tokens__
    {
        VOID = 257,
        FLOAT,
        STRUCT,
        PTR_OP,
        IDENTIFIER,
        INT_CONSTANT,
        FLOAT_CONSTANT,
        RETURN,
        OR_OP,
        AND_OP,
        EQ_OP,
        NE_OP,
        LE_OP,
        GE_OP,
        INC_OP,
        STRING_LITERAL,
        IF,
        ELSE,
        WHILE,
        FOR,
        INT,
    };

// $insert STYPE
    typedef Meta__::SType STYPE__;
	public: static STYPE__  d_val__; 


    private:
        int d_stackIdx__;
        std::vector<size_t>   d_stateStack__;
        std::vector<STYPE__>  d_valueStack__;

    protected:
        enum Return__
        {
            PARSE_ACCEPT__ = 0,   // values used as parse()'s return values
            PARSE_ABORT__  = 1
        };
        enum ErrorRecovery__
        {
            DEFAULT_RECOVERY_MODE__,
            UNEXPECTED_TOKEN__,
        };
        bool        d_debug__;
        size_t      d_nErrors__;
        size_t      d_requiredTokens__;
        size_t      d_acceptedTokens__;
        int         d_token__;
        int         d_nextToken__;
        size_t      d_state__;
        STYPE__    *d_vsp__;
        STYPE__     d_nextVal__;

        ParserBase();

// $insert debugdecl
        static std::ostringstream s_out__;
        
        std::string symbol__(int value) const;
        std::string stype__(char const *pre, STYPE__ const &semVal,
                            char const *post = "") const;
        static std::ostream &dflush__(std::ostream &out);
        void ABORT() const;
        void ACCEPT() const;
        void ERROR() const;
        void clearin();
        bool debug() const;
        void pop__(size_t count = 1);
        void push__(size_t nextState);
        void popToken__();
        void pushToken__(int token);
        void reduce__(PI__ const &productionInfo);
        void errorVerbose__();
        size_t top__() const;

    public:
        void setDebug(bool mode);
}; 

inline bool ParserBase::debug() const
{
    return d_debug__;
}

inline void ParserBase::setDebug(bool mode)
{
    d_debug__ = mode;
}

inline void ParserBase::ABORT() const
{
    // $insert debug
    if (d_debug__)
        s_out__ <<  "ABORT(): Parsing unsuccessful" << "\n" << dflush__;
    throw PARSE_ABORT__;
}

inline void ParserBase::ACCEPT() const
{
    // $insert debug
    if (d_debug__)
        s_out__ <<  "ACCEPT(): Parsing successful" << "\n" << dflush__;
    throw PARSE_ACCEPT__;
}

inline void ParserBase::ERROR() const
{
    // $insert debug
    if (d_debug__)
        s_out__ <<  "ERROR(): Forced error condition" << "\n" << dflush__;
    throw UNEXPECTED_TOKEN__;
}

// $insert polymorphicInline
namespace Meta__
{

inline Base::Base(Tag__ tag)
:
    d_tag(tag)
{}

inline Tag__ Base::tag() const
{
    return d_tag;
}

template <Tag__ tg_>
inline Semantic<tg_>::Semantic()
:
    Base(tg_),
    d_data(typename TypeOf<tg_>::type())
{}

template <Tag__ tg_>
inline Semantic<tg_>::Semantic(typename TypeOf<tg_>::type const &data)
:
    Base(tg_),
    d_data(data)
{}

template <Tag__ tg_>
inline Semantic<tg_>::Semantic(typename TypeOf<tg_>::type &&tmp)
:
    Base(tg_),
    d_data(std::move(tmp))
{}

template <Tag__ tg_>
inline typename TypeOf<tg_>::type &Semantic<tg_>::data()
{
    return d_data;
}

template <Tag__ tg_>
inline typename TypeOf<tg_>::type &Base::get()
{
    return static_cast<Semantic<tg_> *>(this)->data();
}

inline Tag__ SType::tag() const
{
    return std::shared_ptr<Base>::get()->tag();
}
    
template <Tag__ tg_>
inline typename TypeOf<tg_>::type &SType::get()
{
                    // if we're not yet holding a (tg_) value, initialize to 
                    // a Semantic<tg_> holding a default value
    if (std::shared_ptr<Base>::get() == 0 || tag() != tg_)
        reset(new Semantic<tg_>());

    return std::shared_ptr<Base>::get()->get<tg_>();
}

template <Tag__ tg_>
inline typename TypeOf<tg_>::type &SType::data()
{
    return std::shared_ptr<Base>::get()->get<tg_>();
}

template <bool, typename Tp_>
struct Assign;

template <typename Tp_>
struct Assign<true, Tp_>
{
    static SType &assign(SType *lhs, Tp_ &&tp);
};

template <typename Tp_>
struct Assign<false, Tp_>
{
    static SType &assign(SType *lhs, Tp_ const &tp);
};

template <>
struct Assign<false, SType>
{
    static SType &assign(SType *lhs, SType const &tp);
};

template <typename Tp_>
inline SType &Assign<true, Tp_>::assign(SType *lhs, Tp_ &&tp)
{
    lhs->reset(new Semantic<TagOf<Tp_>::tag>(std::move(tp)));
    return *lhs;
}

template <typename Tp_>
inline SType &Assign<false, Tp_>::assign(SType *lhs, Tp_ const &tp)
{
    lhs->reset(new Semantic<TagOf<Tp_>::tag>(tp));
    return *lhs;
}

inline SType &Assign<false, SType>::assign(SType *lhs, SType const &tp)
{
    return lhs->operator=(tp);
}

template <typename Tp_>
inline SType &SType::operator=(Tp_ &&rhs) 
{
    return Assign<
                std::is_rvalue_reference<Tp_ &&>::value, 
                typename std::remove_reference<Tp_>::type
           >::assign(this, std::forward<Tp_>(rhs));
}

} // namespace Meta__

// As a convenience, when including ParserBase.h its symbols are available as
// symbols in the class Parser, too.
#define Parser ParserBase


#endif


