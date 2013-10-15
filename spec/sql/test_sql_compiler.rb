require_relative 'helpers'
module Alf
  module Sql
    describe Compiler do

      shared_examples_for "a SQL compiled" do

        it{ should be_a(Alf::Sql::Cog) }

        it 'has correct traceability' do
          subject.expr.should be(expr)
        end

        it 'has correct compiler' do
          subject.compiler.should be(compiler)
        end

      end

      def compiler
        @compiler ||= Compiler.new
      end

      subject{ compiler.call(expr) }

      each_query do |query|
        next unless query['sql']

        describe "SQL compilation of '#{query}'" do
          let(:expr){ conn.parse(query['alf']) }

          it_should_behave_like "a SQL compiled"

          it 'should have expected SQL' do
            strip(subject.to_sql).should eq(strip(query['sql']))
          end

          it 'should lead a flattenable result' do
            sexpr = subject.sexpr
            flattened = Processor::Flatten.new(Builder.new).call(sexpr)
            if sexpr.first == :with_exp
              flattened.first.should eq(sexpr.select_exp.first)
            else
              flattened.should eq(sexpr)
            end
          end
        end
      end

    end
  end
end
